# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/terminal_action"
require_relative "../../types/create_terminal_action_response"
require_relative "../../types/terminal_action_query"
require_relative "../../types/search_terminal_actions_response"
require_relative "../../types/get_terminal_action_response"
require_relative "../../types/cancel_terminal_action_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Terminal
    class ActionsClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Terminal::ActionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a Terminal action request and sends it to the specified device.
      #
      # @param idempotency_key [String] A unique string that identifies this `CreateAction` request. Keys can be any
#  valid string
#  but must be unique for every `CreateAction` request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more
#  information.
      # @param action [Hash] The Action to create.Request of type SquareApiClient::TerminalAction, as a Hash
      #   * :id (String) 
      #   * :device_id (String) 
      #   * :deadline_duration (String) 
      #   * :status (String) 
      #   * :cancel_reason (SquareApiClient::ActionCancelReason) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :app_id (String) 
      #   * :location_id (String) 
      #   * :type (SquareApiClient::TerminalActionActionType) 
      #   * :qr_code_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :barcode_contents (String) 
      #   * :save_card_options (Hash)
      #     * :customer_id (String) 
      #     * :card_id (String) 
      #     * :reference_id (String) 
      #   * :signature_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :signature (Array<SquareApiClient::SignatureImage>) 
      #   * :confirmation_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :agree_button_text (String) 
      #     * :disagree_button_text (String) 
      #     * :decision (Hash)
      #       * :has_agreed (Boolean) 
      #   * :receipt_options (Hash)
      #     * :payment_id (String) 
      #     * :print_only (Boolean) 
      #     * :is_duplicate (Boolean) 
      #   * :data_collection_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :input_type (SquareApiClient::DataCollectionOptionsInputType) 
      #     * :collected_data (Hash)
      #       * :input_text (String) 
      #   * :select_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :options (Array<SquareApiClient::SelectOption>) 
      #     * :selected_option (Hash)
      #       * :reference_id (String) 
      #       * :title (String) 
      #   * :device_metadata (Hash)
      #     * :battery_percentage (String) 
      #     * :charging_state (String) 
      #     * :location_id (String) 
      #     * :merchant_id (String) 
      #     * :network_connection_type (String) 
      #     * :payment_region (String) 
      #     * :serial_number (String) 
      #     * :os_version (String) 
      #     * :app_version (String) 
      #     * :wifi_network_name (String) 
      #     * :wifi_network_strength (String) 
      #     * :ip_address (String) 
      #   * :await_next_action (Boolean) 
      #   * :await_next_action_duration (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateTerminalActionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.create(idempotency_key: "thahn-70e75c10-47f7-4ab6-88cc-aaa4076d065e", action: { device_id: "{{DEVICE_ID}}", deadline_duration: "PT5M", type: SAVE_CARD, save_card_options: { customer_id: "{{CUSTOMER_ID}}", reference_id: "user-id-1" } })
      def create(idempotency_key:, action:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, action: action }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions"
end
        SquareApiClient::CreateTerminalActionResponse.from_json(json_object: response.body)
      end
# Retrieves a filtered list of Terminal action requests created by the account
#  making the request. Terminal action requests are available for 30 days.
      #
      # @param query [Hash] Queries terminal actions based on given conditions and sort order.
#  Leaving this unset will return all actions with the default sort order.Request of type SquareApiClient::TerminalActionQuery, as a Hash
      #   * :filter (Hash)
      #     * :device_id (String) 
      #     * :created_at (Hash)
      #       * :start_at (String) 
      #       * :end_at (String) 
      #     * :status (String) 
      #     * :type (SquareApiClient::TerminalActionActionType) 
      #   * :sort (Hash)
      #     * :sort_order (SquareApiClient::SortOrder) 
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more
#  information.
      # @param limit [Integer] Limit the number of results returned for a single request.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::SearchTerminalActionsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.search(query: { filter: { created_at: { start_at: "2022-04-01T00:00:00.000Z" } }, sort: { sort_order: DESC } }, limit: 2)
      def search(query: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, cursor: cursor, limit: limit }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/search"
end
        SquareApiClient::SearchTerminalActionsResponse.from_json(json_object: response.body)
      end
# Retrieves a Terminal action request by `action_id`. Terminal action requests are
#  available for 30 days.
      #
      # @param action_id [String] Unique ID for the desired `TerminalAction`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetTerminalActionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.get(action_id: "action_id")
      def get(action_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/#{action_id}"
end
        SquareApiClient::GetTerminalActionResponse.from_json(json_object: response.body)
      end
# Cancels a Terminal action request if the status of the request permits it.
      #
      # @param action_id [String] Unique ID for the desired `TerminalAction`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CancelTerminalActionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.cancel(action_id: "action_id")
      def cancel(action_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/#{action_id}/cancel"
end
        SquareApiClient::CancelTerminalActionResponse.from_json(json_object: response.body)
      end
    end
    class AsyncActionsClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Terminal::AsyncActionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a Terminal action request and sends it to the specified device.
      #
      # @param idempotency_key [String] A unique string that identifies this `CreateAction` request. Keys can be any
#  valid string
#  but must be unique for every `CreateAction` request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more
#  information.
      # @param action [Hash] The Action to create.Request of type SquareApiClient::TerminalAction, as a Hash
      #   * :id (String) 
      #   * :device_id (String) 
      #   * :deadline_duration (String) 
      #   * :status (String) 
      #   * :cancel_reason (SquareApiClient::ActionCancelReason) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :app_id (String) 
      #   * :location_id (String) 
      #   * :type (SquareApiClient::TerminalActionActionType) 
      #   * :qr_code_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :barcode_contents (String) 
      #   * :save_card_options (Hash)
      #     * :customer_id (String) 
      #     * :card_id (String) 
      #     * :reference_id (String) 
      #   * :signature_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :signature (Array<SquareApiClient::SignatureImage>) 
      #   * :confirmation_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :agree_button_text (String) 
      #     * :disagree_button_text (String) 
      #     * :decision (Hash)
      #       * :has_agreed (Boolean) 
      #   * :receipt_options (Hash)
      #     * :payment_id (String) 
      #     * :print_only (Boolean) 
      #     * :is_duplicate (Boolean) 
      #   * :data_collection_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :input_type (SquareApiClient::DataCollectionOptionsInputType) 
      #     * :collected_data (Hash)
      #       * :input_text (String) 
      #   * :select_options (Hash)
      #     * :title (String) 
      #     * :body (String) 
      #     * :options (Array<SquareApiClient::SelectOption>) 
      #     * :selected_option (Hash)
      #       * :reference_id (String) 
      #       * :title (String) 
      #   * :device_metadata (Hash)
      #     * :battery_percentage (String) 
      #     * :charging_state (String) 
      #     * :location_id (String) 
      #     * :merchant_id (String) 
      #     * :network_connection_type (String) 
      #     * :payment_region (String) 
      #     * :serial_number (String) 
      #     * :os_version (String) 
      #     * :app_version (String) 
      #     * :wifi_network_name (String) 
      #     * :wifi_network_strength (String) 
      #     * :ip_address (String) 
      #   * :await_next_action (Boolean) 
      #   * :await_next_action_duration (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateTerminalActionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.create(idempotency_key: "thahn-70e75c10-47f7-4ab6-88cc-aaa4076d065e", action: { device_id: "{{DEVICE_ID}}", deadline_duration: "PT5M", type: SAVE_CARD, save_card_options: { customer_id: "{{CUSTOMER_ID}}", reference_id: "user-id-1" } })
      def create(idempotency_key:, action:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, action: action }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions"
end
          SquareApiClient::CreateTerminalActionResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a filtered list of Terminal action requests created by the account
#  making the request. Terminal action requests are available for 30 days.
      #
      # @param query [Hash] Queries terminal actions based on given conditions and sort order.
#  Leaving this unset will return all actions with the default sort order.Request of type SquareApiClient::TerminalActionQuery, as a Hash
      #   * :filter (Hash)
      #     * :device_id (String) 
      #     * :created_at (Hash)
      #       * :start_at (String) 
      #       * :end_at (String) 
      #     * :status (String) 
      #     * :type (SquareApiClient::TerminalActionActionType) 
      #   * :sort (Hash)
      #     * :sort_order (SquareApiClient::SortOrder) 
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more
#  information.
      # @param limit [Integer] Limit the number of results returned for a single request.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::SearchTerminalActionsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.search(query: { filter: { created_at: { start_at: "2022-04-01T00:00:00.000Z" } }, sort: { sort_order: DESC } }, limit: 2)
      def search(query: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, cursor: cursor, limit: limit }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/search"
end
          SquareApiClient::SearchTerminalActionsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a Terminal action request by `action_id`. Terminal action requests are
#  available for 30 days.
      #
      # @param action_id [String] Unique ID for the desired `TerminalAction`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetTerminalActionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.get(action_id: "action_id")
      def get(action_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/#{action_id}"
end
          SquareApiClient::GetTerminalActionResponse.from_json(json_object: response.body)
        end
      end
# Cancels a Terminal action request if the status of the request permits it.
      #
      # @param action_id [String] Unique ID for the desired `TerminalAction`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CancelTerminalActionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.actions.cancel(action_id: "action_id")
      def cancel(action_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/actions/#{action_id}/cancel"
end
          SquareApiClient::CancelTerminalActionResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end