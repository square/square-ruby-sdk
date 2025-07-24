# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_workweek_configs_response"
require_relative "../../types/workweek_config"
require_relative "../../types/update_workweek_config_response"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Labor
    class WorkweekConfigsClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Labor::WorkweekConfigsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a list of `WorkweekConfig` instances for a business.
      #
      # @param limit [Integer] The maximum number of `WorkweekConfigs` results to return per page.
      # @param cursor [String] A pointer to the next page of `WorkweekConfig` results to fetch.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListWorkweekConfigsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.workweek_configs.list
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/workweek-configs"
end
        SquareApiClient::ListWorkweekConfigsResponse.from_json(json_object: response.body)
      end
# Updates a `WorkweekConfig`.
      #
      # @param id [String] The UUID for the `WorkweekConfig` object being updated.
      # @param workweek_config [Hash] The updated `WorkweekConfig` object.Request of type SquareApiClient::WorkweekConfig, as a Hash
      #   * :id (String) 
      #   * :start_of_week (SquareApiClient::Weekday) 
      #   * :start_of_day_local_time (String) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdateWorkweekConfigResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.workweek_configs.get(id: "id", workweek_config: { start_of_week: MON, start_of_day_local_time: "10:00", version: 10 })
      def get(id:, workweek_config:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), workweek_config: workweek_config }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/workweek-configs/#{id}"
end
        SquareApiClient::UpdateWorkweekConfigResponse.from_json(json_object: response.body)
      end
    end
    class AsyncWorkweekConfigsClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Labor::AsyncWorkweekConfigsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a list of `WorkweekConfig` instances for a business.
      #
      # @param limit [Integer] The maximum number of `WorkweekConfigs` results to return per page.
      # @param cursor [String] A pointer to the next page of `WorkweekConfig` results to fetch.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListWorkweekConfigsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.workweek_configs.list
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/workweek-configs"
end
          SquareApiClient::ListWorkweekConfigsResponse.from_json(json_object: response.body)
        end
      end
# Updates a `WorkweekConfig`.
      #
      # @param id [String] The UUID for the `WorkweekConfig` object being updated.
      # @param workweek_config [Hash] The updated `WorkweekConfig` object.Request of type SquareApiClient::WorkweekConfig, as a Hash
      #   * :id (String) 
      #   * :start_of_week (SquareApiClient::Weekday) 
      #   * :start_of_day_local_time (String) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdateWorkweekConfigResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.workweek_configs.get(id: "id", workweek_config: { start_of_week: MON, start_of_day_local_time: "10:00", version: 10 })
      def get(id:, workweek_config:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), workweek_config: workweek_config }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/workweek-configs/#{id}"
end
          SquareApiClient::UpdateWorkweekConfigResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end