# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_customer_segments_response"
require_relative "../../types/get_customer_segment_response"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Customers
    class SegmentsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::SegmentsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves the list of customer segments of a business.
      #
      # @param cursor [String] A pagination cursor returned by previous calls to `ListCustomerSegments`.
#  This cursor is used to retrieve the next set of query results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param limit [Integer] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the specified limit is less than 1 or greater than 50, Square returns a `400
#  VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 50.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerSegmentsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.segments.list
      def list(cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/segments"
end
        square.rb::ListCustomerSegmentsResponse.from_json(json_object: response.body)
      end
# Retrieves a specific customer segment as identified by the `segment_id` value.
      #
      # @param segment_id [String] The Square-issued ID of the customer segment.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerSegmentResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.segments.get(segment_id: "segment_id")
      def get(segment_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/segments/#{segment_id}"
end
        square.rb::GetCustomerSegmentResponse.from_json(json_object: response.body)
      end
    end
    class AsyncSegmentsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Customers::AsyncSegmentsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves the list of customer segments of a business.
      #
      # @param cursor [String] A pagination cursor returned by previous calls to `ListCustomerSegments`.
#  This cursor is used to retrieve the next set of query results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param limit [Integer] The maximum number of results to return in a single page. This limit is
#  advisory. The response might contain more or fewer results.
#  If the specified limit is less than 1 or greater than 50, Square returns a `400
#  VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 50.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListCustomerSegmentsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.segments.list
      def list(cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/segments"
end
          square.rb::ListCustomerSegmentsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a specific customer segment as identified by the `segment_id` value.
      #
      # @param segment_id [String] The Square-issued ID of the customer segment.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetCustomerSegmentResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.customers.segments.get(segment_id: "segment_id")
      def get(segment_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/customers/segments/#{segment_id}"
end
          square.rb::GetCustomerSegmentResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end