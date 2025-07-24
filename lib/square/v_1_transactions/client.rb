# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/sort_order"
require_relative "../types/v_1_order"
require "json"
require_relative "../types/v_1_update_order_request_action"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class V1TransactionsClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::V1TransactionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Provides summary information for a merchant's online store orders.
    #
    # @param location_id [String] The ID of the location to list online store orders for.
    # @param order [SquareApiClient::SortOrder] The order in which payments are listed in the response.
    # @param limit [Integer] The maximum number of payments to return in a single response. This value cannot
#  exceed 200.
    # @param batch_token [String] A pagination cursor to retrieve the next set of results for your
#  original query to the endpoint.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [Array<SquareApiClient::V1Order>]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.v_1_transactions.v_1_list_orders(location_id: "location_id")
    def v_1_list_orders(location_id:, order: nil, limit: nil, batch_token: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "batch_token": batch_token }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v1/#{location_id}/orders"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        SquareApiClient::V1Order.from_json(json_object: item)
      end
    end
# Provides comprehensive information for a single online store order, including
#  the order's history.
    #
    # @param location_id [String] The ID of the order's associated location.
    # @param order_id [String] The order's Square-issued ID. You obtain this value from Order objects returned
#  by the List Orders endpoint
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::V1Order]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.v_1_transactions.v_1_retrieve_order(location_id: "location_id", order_id: "order_id")
    def v_1_retrieve_order(location_id:, order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v1/#{location_id}/orders/#{order_id}"
end
      SquareApiClient::V1Order.from_json(json_object: response.body)
    end
# Updates the details of an online store order. Every update you perform on an
#  order corresponds to one of three actions:
    #
    # @param location_id [String] The ID of the order's associated location.
    # @param order_id [String] The order's Square-issued ID. You obtain this value from Order objects returned
#  by the List Orders endpoint
    # @param action [SquareApiClient::V1UpdateOrderRequestAction] The action to perform on the order (COMPLETE, CANCEL, or REFUND).
#  See [V1UpdateOrderRequestAction](#type-v1updateorderrequestaction) for possible
#  values
    # @param shipped_tracking_number [String] The tracking number of the shipment associated with the order. Only valid if
#  action is COMPLETE.
    # @param completed_note [String] A merchant-specified note about the completion of the order. Only valid if
#  action is COMPLETE.
    # @param refunded_note [String] A merchant-specified note about the refunding of the order. Only valid if action
#  is REFUND.
    # @param canceled_note [String] A merchant-specified note about the canceling of the order. Only valid if action
#  is CANCEL.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::V1Order]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.v_1_transactions.v_1_update_order(
#    location_id: "location_id",
#    order_id: "order_id",
#    action: COMPLETE
#  )
    def v_1_update_order(location_id:, order_id:, action:, shipped_tracking_number: nil, completed_note: nil, refunded_note: nil, canceled_note: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), action: action, shipped_tracking_number: shipped_tracking_number, completed_note: completed_note, refunded_note: refunded_note, canceled_note: canceled_note }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v1/#{location_id}/orders/#{order_id}"
end
      SquareApiClient::V1Order.from_json(json_object: response.body)
    end
  end
  class AsyncV1TransactionsClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncV1TransactionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Provides summary information for a merchant's online store orders.
    #
    # @param location_id [String] The ID of the location to list online store orders for.
    # @param order [SquareApiClient::SortOrder] The order in which payments are listed in the response.
    # @param limit [Integer] The maximum number of payments to return in a single response. This value cannot
#  exceed 200.
    # @param batch_token [String] A pagination cursor to retrieve the next set of results for your
#  original query to the endpoint.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [Array<SquareApiClient::V1Order>]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.v_1_transactions.v_1_list_orders(location_id: "location_id")
    def v_1_list_orders(location_id:, order: nil, limit: nil, batch_token: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "batch_token": batch_token }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v1/#{location_id}/orders"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          SquareApiClient::V1Order.from_json(json_object: item)
        end
      end
    end
# Provides comprehensive information for a single online store order, including
#  the order's history.
    #
    # @param location_id [String] The ID of the order's associated location.
    # @param order_id [String] The order's Square-issued ID. You obtain this value from Order objects returned
#  by the List Orders endpoint
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::V1Order]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.v_1_transactions.v_1_retrieve_order(location_id: "location_id", order_id: "order_id")
    def v_1_retrieve_order(location_id:, order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v1/#{location_id}/orders/#{order_id}"
end
        SquareApiClient::V1Order.from_json(json_object: response.body)
      end
    end
# Updates the details of an online store order. Every update you perform on an
#  order corresponds to one of three actions:
    #
    # @param location_id [String] The ID of the order's associated location.
    # @param order_id [String] The order's Square-issued ID. You obtain this value from Order objects returned
#  by the List Orders endpoint
    # @param action [SquareApiClient::V1UpdateOrderRequestAction] The action to perform on the order (COMPLETE, CANCEL, or REFUND).
#  See [V1UpdateOrderRequestAction](#type-v1updateorderrequestaction) for possible
#  values
    # @param shipped_tracking_number [String] The tracking number of the shipment associated with the order. Only valid if
#  action is COMPLETE.
    # @param completed_note [String] A merchant-specified note about the completion of the order. Only valid if
#  action is COMPLETE.
    # @param refunded_note [String] A merchant-specified note about the refunding of the order. Only valid if action
#  is REFUND.
    # @param canceled_note [String] A merchant-specified note about the canceling of the order. Only valid if action
#  is CANCEL.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::V1Order]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.v_1_transactions.v_1_update_order(
#    location_id: "location_id",
#    order_id: "order_id",
#    action: COMPLETE
#  )
    def v_1_update_order(location_id:, order_id:, action:, shipped_tracking_number: nil, completed_note: nil, refunded_note: nil, canceled_note: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), action: action, shipped_tracking_number: shipped_tracking_number, completed_note: completed_note, refunded_note: refunded_note, canceled_note: canceled_note }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v1/#{location_id}/orders/#{order_id}"
end
        SquareApiClient::V1Order.from_json(json_object: response.body)
      end
    end
  end
end