# frozen_string_literal: true

require "custom/test_helper"
require "square/reporting_helper"

# Offline unit tests for the custom Reporting polling helper
# (Square::Reporting::Client#load_and_wait). These never touch the network: a
# fake raw client scripts the HTTP bodies, so the test exercises the real
# `load` method and the real LoadResponse deserializer end-to-end.
class ReportingHelperTest < Minitest::Test
  CONTINUE_WAIT = '{"error":"Continue wait"}'
  # The regenerated LoadResponse is FLAT: results land in `data` (no `results`
  # wrapper). An empty `data` array deserializes to [] via the LoadResultData
  # union's Array member.
  REAL_RESULT = '{"data":[],"queryType":"regularQuery"}'

  # Minimal stand-in for the HTTP response object the generated client expects
  # (`response.code` + `response.body`).
  FakeResponse = Struct.new(:code, :body)

  # Fake raw client that returns scripted bodies in order and records how many
  # times it was called.
  class FakeRawClient
    attr_reader :calls

    def initialize(bodies)
      @bodies = bodies
      @calls = 0
    end

    def send(_request)
      body = @bodies.fetch(@calls)
      @calls += 1
      FakeResponse.new(200, body)
    end
  end

  def reporting_client(bodies)
    raw = FakeRawClient.new(bodies)
    [Square::Reporting::Client.new(client: raw), raw]
  end

  def test_polls_through_continue_wait_then_returns_result
    client, raw = reporting_client([CONTINUE_WAIT, CONTINUE_WAIT, REAL_RESULT])

    response = client.load_and_wait(query: {}, initial_delay: 0, max_delay: 0)

    assert_instance_of Square::Types::LoadResponse, response
    assert_equal [], response.data
    assert_equal 3, raw.calls
  end

  def test_returns_immediately_when_already_resolved
    client, raw = reporting_client([REAL_RESULT])

    response = client.load_and_wait(query: {})

    assert_equal [], response.data
    assert_equal 1, raw.calls
  end

  def test_raises_timeout_after_max_attempts
    client, raw = reporting_client([CONTINUE_WAIT] * 5)

    error = assert_raises(Square::Reporting::ContinueWaitTimeoutError) do
      client.load_and_wait(query: {}, max_attempts: 3, initial_delay: 0, max_delay: 0)
    end

    assert_equal 3, raw.calls
    assert_match(/did not complete after 3 attempts/, error.message)
  end

  def test_honors_cancellation
    client, raw = reporting_client([CONTINUE_WAIT] * 5)
    checks = 0
    should_cancel = -> {
      checks += 1
      checks >= 2
    }

    assert_raises(Square::Reporting::PollingCancelledError) do
      client.load_and_wait(query: {}, initial_delay: 5, should_cancel: should_cancel)
    end

    # Cancelled during the first backoff wait, before exhausting the script.
    assert_operator raw.calls, :<, 5
  end

  # Crux: prove the "Continue wait" body survives the real deserializer as a
  # detectable sentinel (extra `error` field, `data` absent) — the same
  # passthrough behavior the helper relies on, confirmed for Ruby here.
  def test_continue_wait_sentinel_survives_real_deserialization
    response = Square::Types::LoadResponse.load(CONTINUE_WAIT)

    assert_equal "Continue wait", response.to_h["error"]
    assert_nil response.data
  end

  def test_real_result_is_not_treated_as_sentinel
    response = Square::Types::LoadResponse.load(REAL_RESULT)

    assert_nil response.to_h["error"]
    assert_equal [], response.data
  end
end
