# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_break_types_response"
require_relative "../../types/break_type"
require_relative "../../types/create_break_type_response"
require_relative "../../types/get_break_type_response"
require_relative "../../types/update_break_type_response"
require_relative "../../types/delete_break_type_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Labor
    class BreakTypesClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Labor::BreakTypesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a paginated list of `BreakType` instances for a business.
      #
      # @param location_id [String] Filter the returned `BreakType` results to only those that are associated with
#  the
#  specified location.
      # @param limit [Integer] The maximum number of `BreakType` results to return per page. The number can
#  range between 1
#  and 200. The default is 200.
      # @param cursor [String] A pointer to the next page of `BreakType` results to fetch.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListBreakTypesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.list
      def list(location_id: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types"
end
        square.rb::ListBreakTypesResponse.from_json(json_object: response.body)
      end
# Creates a new `BreakType`.
#  A `BreakType` is a template for creating `Break` objects.
#  You must provide the following values in your request to this
#  endpoint:
#  - `location_id`
#  - `break_name`
#  - `expected_duration`
#  - `is_paid`
#  You can only have three `BreakType` instances per location. If you attempt to
#  add a fourth
#  `BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of 3
#  breaks per location."
#  is returned.
      #
      # @param idempotency_key [String] A unique string value to ensure the idempotency of the operation.
      # @param break_type [Hash] The `BreakType` to be created.Request of type square.rb::BreakType, as a Hash
      #   * :id (String) 
      #   * :location_id (String) 
      #   * :break_name (String) 
      #   * :expected_duration (String) 
      #   * :is_paid (Boolean) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.create(idempotency_key: "PAD3NG5KSN2GL", break_type: { location_id: "CGJN03P1D08GF", break_name: "Lunch Break", expected_duration: "PT30M", is_paid: true })
      def create(idempotency_key: nil, break_type:, request_options: nil)
        response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, break_type: break_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types"
end
        square.rb::CreateBreakTypeResponse.from_json(json_object: response.body)
      end
# Returns a single `BreakType` specified by `id`.
      #
      # @param id [String] The UUID for the `BreakType` being retrieved.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.get(id: "id")
      def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types/#{id}"
end
        square.rb::GetBreakTypeResponse.from_json(json_object: response.body)
      end
# Updates an existing `BreakType`.
      #
      # @param id [String] The UUID for the `BreakType` being updated.
      # @param break_type [Hash] The updated `BreakType`.Request of type square.rb::BreakType, as a Hash
      #   * :id (String) 
      #   * :location_id (String) 
      #   * :break_name (String) 
      #   * :expected_duration (String) 
      #   * :is_paid (Boolean) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.update(id: "id", break_type: { location_id: "26M7H24AZ9N6R", break_name: "Lunch", expected_duration: "PT50M", is_paid: true, version: 1 })
      def update(id:, break_type:, request_options: nil)
        response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), break_type: break_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types/#{id}"
end
        square.rb::UpdateBreakTypeResponse.from_json(json_object: response.body)
      end
# Deletes an existing `BreakType`.
#  A `BreakType` can be deleted even if it is referenced from a `Shift`.
      #
      # @param id [String] The UUID for the `BreakType` being deleted.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.delete(id: "id")
      def delete(id:, request_options: nil)
        response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types/#{id}"
end
        square.rb::DeleteBreakTypeResponse.from_json(json_object: response.body)
      end
    end
    class AsyncBreakTypesClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Labor::AsyncBreakTypesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a paginated list of `BreakType` instances for a business.
      #
      # @param location_id [String] Filter the returned `BreakType` results to only those that are associated with
#  the
#  specified location.
      # @param limit [Integer] The maximum number of `BreakType` results to return per page. The number can
#  range between 1
#  and 200. The default is 200.
      # @param cursor [String] A pointer to the next page of `BreakType` results to fetch.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListBreakTypesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.list
      def list(location_id: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types"
end
          square.rb::ListBreakTypesResponse.from_json(json_object: response.body)
        end
      end
# Creates a new `BreakType`.
#  A `BreakType` is a template for creating `Break` objects.
#  You must provide the following values in your request to this
#  endpoint:
#  - `location_id`
#  - `break_name`
#  - `expected_duration`
#  - `is_paid`
#  You can only have three `BreakType` instances per location. If you attempt to
#  add a fourth
#  `BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of 3
#  breaks per location."
#  is returned.
      #
      # @param idempotency_key [String] A unique string value to ensure the idempotency of the operation.
      # @param break_type [Hash] The `BreakType` to be created.Request of type square.rb::BreakType, as a Hash
      #   * :id (String) 
      #   * :location_id (String) 
      #   * :break_name (String) 
      #   * :expected_duration (String) 
      #   * :is_paid (Boolean) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.create(idempotency_key: "PAD3NG5KSN2GL", break_type: { location_id: "CGJN03P1D08GF", break_name: "Lunch Break", expected_duration: "PT30M", is_paid: true })
      def create(idempotency_key: nil, break_type:, request_options: nil)
        Async do
          response = @request_client.conn.post do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, break_type: break_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types"
end
          square.rb::CreateBreakTypeResponse.from_json(json_object: response.body)
        end
      end
# Returns a single `BreakType` specified by `id`.
      #
      # @param id [String] The UUID for the `BreakType` being retrieved.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.get(id: "id")
      def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types/#{id}"
end
          square.rb::GetBreakTypeResponse.from_json(json_object: response.body)
        end
      end
# Updates an existing `BreakType`.
      #
      # @param id [String] The UUID for the `BreakType` being updated.
      # @param break_type [Hash] The updated `BreakType`.Request of type square.rb::BreakType, as a Hash
      #   * :id (String) 
      #   * :location_id (String) 
      #   * :break_name (String) 
      #   * :expected_duration (String) 
      #   * :is_paid (Boolean) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.update(id: "id", break_type: { location_id: "26M7H24AZ9N6R", break_name: "Lunch", expected_duration: "PT50M", is_paid: true, version: 1 })
      def update(id:, break_type:, request_options: nil)
        Async do
          response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), break_type: break_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types/#{id}"
end
          square.rb::UpdateBreakTypeResponse.from_json(json_object: response.body)
        end
      end
# Deletes an existing `BreakType`.
#  A `BreakType` can be deleted even if it is referenced from a `Shift`.
      #
      # @param id [String] The UUID for the `BreakType` being deleted.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteBreakTypeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.break_types.delete(id: "id")
      def delete(id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/break-types/#{id}"
end
          square.rb::DeleteBreakTypeResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end