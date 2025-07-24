# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_location_booking_profiles_response"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Bookings
    class LocationProfilesClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Bookings::LocationProfilesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists location booking profiles of a seller.
      #
      # @param limit [Integer] The maximum number of results to return in a paged response.
      # @param cursor [String] The pagination cursor from the preceding response to return the next page of the
#  results. Do not set this when retrieving the first page of the results.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListLocationBookingProfilesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.location_profiles.list
      def list(limit: nil, cursor: nil, request_options: nil)
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/location-booking-profiles"
end
        SquareApiClient::ListLocationBookingProfilesResponse.from_json(json_object: response.body)
      end
    end
    class AsyncLocationProfilesClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Bookings::AsyncLocationProfilesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists location booking profiles of a seller.
      #
      # @param limit [Integer] The maximum number of results to return in a paged response.
      # @param cursor [String] The pagination cursor from the preceding response to return the next page of the
#  results. Do not set this when retrieving the first page of the results.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListLocationBookingProfilesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.location_profiles.list
      def list(limit: nil, cursor: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/location-booking-profiles"
end
          SquareApiClient::ListLocationBookingProfilesResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end