# frozen_string_literal: true
require_relative "../../requests"
require_relative "actions/client"
require_relative "checkouts/client"
require_relative "refunds/client"
require_relative "../types/dismiss_terminal_action_response"
require_relative "../types/dismiss_terminal_checkout_response"
require_relative "../types/dismiss_terminal_refund_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class TerminalClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Terminal::ActionsClient] 
    attr_reader :actions
  # @return [SquareApiClient::Terminal::CheckoutsClient] 
    attr_reader :checkouts
  # @return [SquareApiClient::Terminal::RefundsClient] 
    attr_reader :refunds


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::TerminalClient]
    def initialize(request_client:)
      @request_client = request_client
      @actions = SquareApiClient::Terminal::ActionsClient.new(request_client: request_client)
      @checkouts = SquareApiClient::Terminal::CheckoutsClient.new(request_client: request_client)
      @refunds = SquareApiClient::Terminal::RefundsClient.new(request_client: request_client)
    end
# Dismisses a Terminal action request if the status and type of the request
#  permits it.
#  See [Link and Dismiss
#  m/docs/terminal-api/advanced-features/custom-workflows/link-and-dismiss-actions)
#  for more details.
    #
    # @param action_id [String] Unique ID for the `TerminalAction` associated with the action to be dismissed.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DismissTerminalActionResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.dismiss_terminal_action(action_id: "action_id")
    def dismiss_terminal_action(action_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/#{action_id}/dismiss"
end
      SquareApiClient::DismissTerminalActionResponse.from_json(json_object: response.body)
    end
# Dismisses a Terminal checkout request if the status and type of the request
#  permits it.
    #
    # @param checkout_id [String] Unique ID for the `TerminalCheckout` associated with the checkout to be
#  dismissed.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DismissTerminalCheckoutResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.dismiss_terminal_checkout(checkout_id: "checkout_id")
    def dismiss_terminal_checkout(checkout_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/#{checkout_id}/dismiss"
end
      SquareApiClient::DismissTerminalCheckoutResponse.from_json(json_object: response.body)
    end
# Dismisses a Terminal refund request if the status and type of the request
#  permits it.
    #
    # @param terminal_refund_id [String] Unique ID for the `TerminalRefund` associated with the refund to be dismissed.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DismissTerminalRefundResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.dismiss_terminal_refund(terminal_refund_id: "terminal_refund_id")
    def dismiss_terminal_refund(terminal_refund_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/#{terminal_refund_id}/dismiss"
end
      SquareApiClient::DismissTerminalRefundResponse.from_json(json_object: response.body)
    end
  end
  class AsyncTerminalClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Terminal::ActionsClient] 
    attr_reader :actions
  # @return [SquareApiClient::Terminal::CheckoutsClient] 
    attr_reader :checkouts
  # @return [SquareApiClient::Terminal::RefundsClient] 
    attr_reader :refunds


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncTerminalClient]
    def initialize(request_client:)
      @request_client = request_client
      @actions = SquareApiClient::Terminal::AsyncActionsClient.new(request_client: request_client)
      @checkouts = SquareApiClient::Terminal::AsyncCheckoutsClient.new(request_client: request_client)
      @refunds = SquareApiClient::Terminal::AsyncRefundsClient.new(request_client: request_client)
    end
# Dismisses a Terminal action request if the status and type of the request
#  permits it.
#  See [Link and Dismiss
#  m/docs/terminal-api/advanced-features/custom-workflows/link-and-dismiss-actions)
#  for more details.
    #
    # @param action_id [String] Unique ID for the `TerminalAction` associated with the action to be dismissed.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DismissTerminalActionResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.dismiss_terminal_action(action_id: "action_id")
    def dismiss_terminal_action(action_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/#{action_id}/dismiss"
end
        SquareApiClient::DismissTerminalActionResponse.from_json(json_object: response.body)
      end
    end
# Dismisses a Terminal checkout request if the status and type of the request
#  permits it.
    #
    # @param checkout_id [String] Unique ID for the `TerminalCheckout` associated with the checkout to be
#  dismissed.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DismissTerminalCheckoutResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.dismiss_terminal_checkout(checkout_id: "checkout_id")
    def dismiss_terminal_checkout(checkout_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/#{checkout_id}/dismiss"
end
        SquareApiClient::DismissTerminalCheckoutResponse.from_json(json_object: response.body)
      end
    end
# Dismisses a Terminal refund request if the status and type of the request
#  permits it.
    #
    # @param terminal_refund_id [String] Unique ID for the `TerminalRefund` associated with the refund to be dismissed.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DismissTerminalRefundResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.dismiss_terminal_refund(terminal_refund_id: "terminal_refund_id")
    def dismiss_terminal_refund(terminal_refund_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/#{terminal_refund_id}/dismiss"
end
        SquareApiClient::DismissTerminalRefundResponse.from_json(json_object: response.body)
      end
    end
  end
end