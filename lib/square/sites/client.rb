# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/list_sites_response"
require "async"
require_relative "../../requests"

module square.rb
  class SitesClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::SitesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Lists the Square Online sites that belong to a seller. Sites are listed in
#  descending order by the `created_at` date.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListSitesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.sites.list
    def list(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites"
end
      square.rb::ListSitesResponse.from_json(json_object: response.body)
    end
  end
  class AsyncSitesClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncSitesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Lists the Square Online sites that belong to a seller. Sites are listed in
#  descending order by the `created_at` date.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListSitesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.sites.list
    def list(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites"
end
        square.rb::ListSitesResponse.from_json(json_object: response.body)
      end
    end
  end
end