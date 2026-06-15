# frozen_string_literal: true

require_relative "../square"

module Square
  module Reporting
    # Raised by {Client#load_and_wait} when a reporting query has not finished
    # after the configured maximum number of attempts.
    class ContinueWaitTimeoutError < StandardError; end

    # Raised by {Client#load_and_wait} when the caller-supplied +should_cancel+
    # predicate returns a truthy value, aborting the polling loop.
    class PollingCancelledError < StandardError; end

    # Custom, +.fernignore+-protected polling helper for the Reporting API.
    #
    # The +/reporting/v1/load+ endpoint is asynchronous: a query that is still
    # being computed comes back as an HTTP 200 whose body is
    # +{ "error": "Continue wait" }+ rather than the results. Callers are expected
    # to re-send the identical request, with backoff, until real results arrive.
    # This file reopens the generated {Square::Reporting::Client} to add
    # +load_and_wait+, which owns that retry loop.
    #
    # @example
    #   require "square"
    #   require "square/reporting_helper"
    #
    #   client = Square::Client.new(token: ENV.fetch("SQUARE_TOKEN"))
    #   response = client.reporting.load_and_wait(query: { ... })
    class Client
      # The value of the +error+ field the Reporting API returns on an HTTP 200
      # while a +/reporting/v1/load+ query is still processing. It is NOT a
      # failure — the identical request should be re-sent until real results
      # arrive. See https://developer.squareup.com/docs/reporting-api/overview.
      CONTINUE_WAIT_SENTINEL = "Continue wait"

      # Default polling parameters for {#load_and_wait}.
      DEFAULT_MAX_ATTEMPTS = 20
      DEFAULT_INITIAL_DELAY = 2.0
      DEFAULT_MAX_DELAY = 20.0
      DEFAULT_BACKOFF_FACTOR = 2.0

      # Granularity (seconds) at which a backoff wait checks +should_cancel+, so
      # cancellation stays responsive even during a long delay.
      POLL_TICK = 0.1

      # Runs a reporting query and transparently polls until it resolves,
      # returning the final {Square::Types::LoadResponse}.
      #
      # A query that is still being computed comes back as an HTTP 200 whose body
      # is +{ "error": "Continue wait" }+. That body deserializes into a
      # +LoadResponse+ whose +error+ key lands in the model's extra fields (it is
      # not a declared field) while +results+ stays +nil+; that is the signal to
      # retry. +load_and_wait+ re-sends the identical request with exponential
      # backoff until real results arrive.
      #
      # @param request_options [Hash] forwarded verbatim to each underlying
      #   {#load} call.
      # @param max_attempts [Integer] maximum number of +load+ calls before
      #   giving up. Defaults to {DEFAULT_MAX_ATTEMPTS}.
      # @param initial_delay [Numeric] delay (seconds) before the first retry.
      #   Defaults to {DEFAULT_INITIAL_DELAY}.
      # @param max_delay [Numeric] upper bound (seconds) on the backoff delay.
      #   Defaults to {DEFAULT_MAX_DELAY}.
      # @param backoff_factor [Numeric] multiplier applied to the delay after each
      #   attempt. Defaults to {DEFAULT_BACKOFF_FACTOR}.
      # @param should_cancel [#call, nil] optional predicate checked before each
      #   attempt and during each backoff wait; when it returns a truthy value the
      #   loop aborts with {PollingCancelledError}. This is the Ruby idiom for
      #   TypeScript's +AbortSignal+ / Go's +context.Context+.
      # @param params [Hash] the reporting query, forwarded verbatim to {#load}
      #   (same keyword arguments as a direct +load+ call).
      #
      # @return [Square::Types::LoadResponse] the resolved response.
      #
      # @raise [ContinueWaitTimeoutError] if the query has not resolved within
      #   +max_attempts+ attempts.
      # @raise [PollingCancelledError] if +should_cancel+ returns a truthy value.
      def load_and_wait(
        request_options: {},
        max_attempts: DEFAULT_MAX_ATTEMPTS,
        initial_delay: DEFAULT_INITIAL_DELAY,
        max_delay: DEFAULT_MAX_DELAY,
        backoff_factor: DEFAULT_BACKOFF_FACTOR,
        should_cancel: nil,
        **params
      )
        delay = initial_delay
        attempt = 1

        loop do
          raise PollingCancelledError if should_cancel&.call

          response = load(request_options: request_options, **params)
          return response unless continue_wait?(response)

          break if attempt >= max_attempts

          cancellable_sleep(delay, should_cancel)

          attempt += 1
          delay = [delay * backoff_factor, max_delay].min
        end

        raise ContinueWaitTimeoutError,
              "Reporting query did not complete after #{max_attempts} attempts " \
              "(#{CONTINUE_WAIT_SENTINEL.inspect})"
      end

      private

      # @param response [Square::Types::LoadResponse]
      # @return [Boolean] whether +response+ is the "still processing" sentinel
      #   rather than a real result.
      def continue_wait?(response)
        return false if response.nil?

        response.to_h["error"] == CONTINUE_WAIT_SENTINEL
      end

      # Sleeps for +seconds+, waking every {POLL_TICK} to honor +should_cancel+.
      #
      # @param seconds [Numeric]
      # @param should_cancel [#call, nil]
      # @return [void]
      # @raise [PollingCancelledError] if +should_cancel+ becomes truthy.
      def cancellable_sleep(seconds, should_cancel)
        return if seconds <= 0

        deadline = monotonic_now + seconds
        loop do
          raise PollingCancelledError if should_cancel&.call

          remaining = deadline - monotonic_now
          break if remaining <= 0

          sleep([remaining, POLL_TICK].min)
        end
      end

      # @return [Float] a monotonic clock reading in seconds.
      def monotonic_now
        Process.clock_gettime(Process::CLOCK_MONOTONIC)
      end
    end
  end
end
