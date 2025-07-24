# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/product_type"
require_relative "../../types/device_code_status"
require_relative "../../types/list_device_codes_response"
require_relative "../../types/device_code"
require_relative "../../types/create_device_code_response"
require_relative "../../types/get_device_code_response"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Devices
    class CodesClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Devices::CodesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all DeviceCodes associated with the merchant.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
      # @param location_id [String] If specified, only returns DeviceCodes of the specified location.
#  Returns DeviceCodes of all locations if empty.
      # @param product_type [square.rb::PRODUCT_TYPE] If specified, only returns DeviceCodes targeting the specified product type.
#  Returns DeviceCodes of all product types if empty.
      # @param status [square.rb::DeviceCodeStatus] If specified, returns DeviceCodes with the specified statuses.
#  Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListDeviceCodesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.codes.list
      def list(cursor: nil, location_id: nil, product_type: nil, status: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "location_id": location_id, "product_type": product_type, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/codes"
end
        square.rb::ListDeviceCodesResponse.from_json(json_object: response.body)
      end
# Creates a DeviceCode that can be used to login to a Square Terminal device to
#  enter the connected
#  terminal mode.
      #
      # @param idempotency_key [String] A unique string that identifies this CreateDeviceCode request. Keys can
#  be any valid string but must be unique for every CreateDeviceCode request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param device_code [Hash] The device code to create.Request of type square.rb::DeviceCode, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :code (String) 
      #   * :device_id (String) 
      #   * :product_type (square.rb::PRODUCT_TYPE) 
      #   * :location_id (String) 
      #   * :status (square.rb::DeviceCodeStatus) 
      #   * :pair_by (String) 
      #   * :created_at (String) 
      #   * :status_changed_at (String) 
      #   * :paired_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateDeviceCodeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.codes.create(idempotency_key: "01bb00a6-0c86-4770-94ed-f5fca973cd56", device_code: { name: "Counter 1", product_type: "TERMINAL_API", location_id: "B5E4484SHHNYH" })
      def create(idempotency_key:, device_code:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, device_code: device_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/codes"
end
        square.rb::CreateDeviceCodeResponse.from_json(json_object: response.body)
      end
# Retrieves DeviceCode with the associated ID.
      #
      # @param id [String] The unique identifier for the device code.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetDeviceCodeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.codes.get(id: "id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/codes/#{id}"
end
        square.rb::GetDeviceCodeResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCodesClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Devices::AsyncCodesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all DeviceCodes associated with the merchant.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
      # @param location_id [String] If specified, only returns DeviceCodes of the specified location.
#  Returns DeviceCodes of all locations if empty.
      # @param product_type [square.rb::PRODUCT_TYPE] If specified, only returns DeviceCodes targeting the specified product type.
#  Returns DeviceCodes of all product types if empty.
      # @param status [square.rb::DeviceCodeStatus] If specified, returns DeviceCodes with the specified statuses.
#  Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListDeviceCodesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.codes.list
      def list(cursor: nil, location_id: nil, product_type: nil, status: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "location_id": location_id, "product_type": product_type, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/codes"
end
          square.rb::ListDeviceCodesResponse.from_json(json_object: response.body)
        end
      end
# Creates a DeviceCode that can be used to login to a Square Terminal device to
#  enter the connected
#  terminal mode.
      #
      # @param idempotency_key [String] A unique string that identifies this CreateDeviceCode request. Keys can
#  be any valid string but must be unique for every CreateDeviceCode request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param device_code [Hash] The device code to create.Request of type square.rb::DeviceCode, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :code (String) 
      #   * :device_id (String) 
      #   * :product_type (square.rb::PRODUCT_TYPE) 
      #   * :location_id (String) 
      #   * :status (square.rb::DeviceCodeStatus) 
      #   * :pair_by (String) 
      #   * :created_at (String) 
      #   * :status_changed_at (String) 
      #   * :paired_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateDeviceCodeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.codes.create(idempotency_key: "01bb00a6-0c86-4770-94ed-f5fca973cd56", device_code: { name: "Counter 1", product_type: "TERMINAL_API", location_id: "B5E4484SHHNYH" })
      def create(idempotency_key:, device_code:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, device_code: device_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/codes"
end
          square.rb::CreateDeviceCodeResponse.from_json(json_object: response.body)
        end
      end
# Retrieves DeviceCode with the associated ID.
      #
      # @param id [String] The unique identifier for the device code.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetDeviceCodeResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.codes.get(id: "id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/codes/#{id}"
end
          square.rb::GetDeviceCodeResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end