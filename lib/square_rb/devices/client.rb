# frozen_string_literal: true
require_relative "../../requests"
require_relative "codes/client"
require_relative "../types/sort_order"
require_relative "../types/list_devices_response"
require_relative "../types/get_device_response"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class DevicesClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Devices::CodesClient] 
    attr_reader :codes


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::DevicesClient]
    def initialize(request_client:)
      @request_client = request_client
      @codes = SquareApiClient::Devices::CodesClient.new(request_client: request_client)
    end
# List devices associated with the merchant. Currently, only Terminal API
#  devices are supported.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param sort_order [SquareApiClient::SortOrder] The order in which results are listed.
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
    # @param limit [Integer] The number of results to return in a single page.
    # @param location_id [String] If present, only returns devices at the target location.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListDevicesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.list
    def list(cursor: nil, sort_order: nil, limit: nil, location_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "sort_order": sort_order, "limit": limit, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices"
end
      SquareApiClient::ListDevicesResponse.from_json(json_object: response.body)
    end
# Retrieves Device with the associated `device_id`.
    #
    # @param device_id [String] The unique ID for the desired `Device`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetDeviceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.get(device_id: "device_id")
    def get(device_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/#{device_id}"
end
      SquareApiClient::GetDeviceResponse.from_json(json_object: response.body)
    end
  end
  class AsyncDevicesClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Devices::CodesClient] 
    attr_reader :codes


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncDevicesClient]
    def initialize(request_client:)
      @request_client = request_client
      @codes = SquareApiClient::Devices::AsyncCodesClient.new(request_client: request_client)
    end
# List devices associated with the merchant. Currently, only Terminal API
#  devices are supported.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param sort_order [SquareApiClient::SortOrder] The order in which results are listed.
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
    # @param limit [Integer] The number of results to return in a single page.
    # @param location_id [String] If present, only returns devices at the target location.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListDevicesResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.list
    def list(cursor: nil, sort_order: nil, limit: nil, location_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "sort_order": sort_order, "limit": limit, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices"
end
        SquareApiClient::ListDevicesResponse.from_json(json_object: response.body)
      end
    end
# Retrieves Device with the associated `device_id`.
    #
    # @param device_id [String] The unique ID for the desired `Device`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetDeviceResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.devices.get(device_id: "device_id")
    def get(device_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/devices/#{device_id}"
end
        SquareApiClient::GetDeviceResponse.from_json(json_object: response.body)
      end
    end
  end
end