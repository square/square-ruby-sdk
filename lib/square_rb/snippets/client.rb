# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/get_snippet_response"
require_relative "../types/snippet"
require_relative "../types/upsert_snippet_response"
require_relative "../types/delete_snippet_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class SnippetsClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::SnippetsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves your snippet from a Square Online site. A site can contain snippets
#  from multiple snippet applications, but you can retrieve only the snippet that
#  was added by your application.
#  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the
#  sites that belong to a seller.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param site_id [String] The ID of the site that contains the snippet.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetSnippetResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.snippets.get(site_id: "site_id")
    def get(site_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites/#{site_id}/snippet"
end
      SquareApiClient::GetSnippetResponse.from_json(json_object: response.body)
    end
# Adds a snippet to a Square Online site or updates the existing snippet on the
#  site.
#  The snippet code is appended to the end of the `head` element on every page of
#  the site, except checkout pages. A snippet application can add one snippet to a
#  given site.
#  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the
#  sites that belong to a seller.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param site_id [String] The ID of the site where you want to add or update the snippet.
    # @param snippet [Hash] The snippet for the site.Request of type SquareApiClient::Snippet, as a Hash
    #   * :id (String) 
    #   * :site_id (String) 
    #   * :content (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpsertSnippetResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.snippets.upsert(site_id: "site_id", snippet: { content: "<script>var js = 1;</script>" })
    def upsert(site_id:, snippet:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), snippet: snippet }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites/#{site_id}/snippet"
end
      SquareApiClient::UpsertSnippetResponse.from_json(json_object: response.body)
    end
# Removes your snippet from a Square Online site.
#  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the
#  sites that belong to a seller.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param site_id [String] The ID of the site that contains the snippet.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteSnippetResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.snippets.delete(site_id: "site_id")
    def delete(site_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites/#{site_id}/snippet"
end
      SquareApiClient::DeleteSnippetResponse.from_json(json_object: response.body)
    end
  end
  class AsyncSnippetsClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncSnippetsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves your snippet from a Square Online site. A site can contain snippets
#  from multiple snippet applications, but you can retrieve only the snippet that
#  was added by your application.
#  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the
#  sites that belong to a seller.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param site_id [String] The ID of the site that contains the snippet.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetSnippetResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.snippets.get(site_id: "site_id")
    def get(site_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites/#{site_id}/snippet"
end
        SquareApiClient::GetSnippetResponse.from_json(json_object: response.body)
      end
    end
# Adds a snippet to a Square Online site or updates the existing snippet on the
#  site.
#  The snippet code is appended to the end of the `head` element on every page of
#  the site, except checkout pages. A snippet application can add one snippet to a
#  given site.
#  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the
#  sites that belong to a seller.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param site_id [String] The ID of the site where you want to add or update the snippet.
    # @param snippet [Hash] The snippet for the site.Request of type SquareApiClient::Snippet, as a Hash
    #   * :id (String) 
    #   * :site_id (String) 
    #   * :content (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpsertSnippetResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.snippets.upsert(site_id: "site_id", snippet: { content: "<script>var js = 1;</script>" })
    def upsert(site_id:, snippet:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), snippet: snippet }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites/#{site_id}/snippet"
end
        SquareApiClient::UpsertSnippetResponse.from_json(json_object: response.body)
      end
    end
# Removes your snippet from a Square Online site.
#  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the
#  sites that belong to a seller.
#  __Note:__ Square Online APIs are publicly available as part of an early access
#  program. For more information, see [Early access program for Square Online
#  loper.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
    #
    # @param site_id [String] The ID of the site that contains the snippet.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteSnippetResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.snippets.delete(site_id: "site_id")
    def delete(site_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/sites/#{site_id}/snippet"
end
        SquareApiClient::DeleteSnippetResponse.from_json(json_object: response.body)
      end
    end
  end
end