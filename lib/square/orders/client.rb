# frozen_string_literal: true
require_relative "../../requests"
require_relative "custom_attribute_definitions/client"
require_relative "custom_attributes/client"
require_relative "../types/create_order_request"
require_relative "../types/create_order_response"
require_relative "../types/batch_get_orders_response"
require_relative "../types/order"
require_relative "../types/order_reward"
require_relative "../types/calculate_order_response"
require_relative "../types/clone_order_response"
require_relative "../types/search_orders_query"
require_relative "../types/search_orders_response"
require_relative "../types/get_order_response"
require_relative "../types/update_order_response"
require_relative "../types/pay_order_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class OrdersClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client
  # @return [square.rb::Orders::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [square.rb::Orders::CustomAttributesClient] 
    attr_reader :custom_attributes


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::OrdersClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = square.rb::Orders::CustomAttributeDefinitionsClient.new(request_client: request_client)
      @custom_attributes = square.rb::Orders::CustomAttributesClient.new(request_client: request_client)
    end
# Creates a new [order](entity:Order) that can include information about products
#  for
#  purchase and settings to apply to the purchase.
#  To pay for a created order, see
#  [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
#  You can modify open orders using the
#  [UpdateOrder](api-endpoint:Orders-UpdateOrder) endpoint.
    #
    # @param request [Hash] Request of type square.rb::CreateOrderRequest, as a Hash
    #   * :order (Hash)
    #     * :id (String) 
    #     * :location_id (String) 
    #     * :reference_id (String) 
    #     * :source (Hash)
    #       * :name (String) 
    #     * :customer_id (String) 
    #     * :line_items (Array<square.rb::OrderLineItem>) 
    #     * :taxes (Array<square.rb::OrderLineItemTax>) 
    #     * :discounts (Array<square.rb::OrderLineItemDiscount>) 
    #     * :service_charges (Array<square.rb::OrderServiceCharge>) 
    #     * :fulfillments (Array<square.rb::Fulfillment>) 
    #     * :returns (Array<square.rb::OrderReturn>) 
    #     * :return_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #     * :net_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #     * :rounding_adjustment (Hash)
    #       * :uid (String) 
    #       * :name (String) 
    #       * :amount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #     * :tenders (Array<square.rb::Tender>) 
    #     * :refunds (Array<square.rb::Refund>) 
    #     * :metadata (Hash{String => String}) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :closed_at (String) 
    #     * :state (square.rb::OrderState) 
    #     * :version (Integer) 
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :ticket_name (String) 
    #     * :pricing_options (Hash)
    #       * :auto_apply_discounts (Boolean) 
    #       * :auto_apply_taxes (Boolean) 
    #     * :rewards (Array<square.rb::OrderReward>) 
    #     * :net_amount_due_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :idempotency_key (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.create(request: { order: { location_id: "057P5VYJ4A5X1", reference_id: "my-order-001", line_items: [{ name: "New York Strip Steak", quantity: "1", base_price_money: { amount: 1599, currency: USD } }, { quantity: "2", catalog_object_id: "BEMYCSMIJL46OCDV4KYIKXIB", modifiers: [{ catalog_object_id: "CHQX7Y4KY6N5KINJKZCFURPZ" }], applied_discounts: [{ discount_uid: "one-dollar-off" }] }], taxes: [{ uid: "state-sales-tax", name: "State Sales Tax", percentage: "9", scope: ORDER }], discounts: [{ uid: "labor-day-sale", name: "Labor Day Sale", percentage: "5", scope: ORDER }, { uid: "membership-discount", catalog_object_id: "DB7L55ZH2BGWI4H23ULIWOQ7", scope: ORDER }, { uid: "one-dollar-off", name: "Sale - $1.00 off", amount_money: { amount: 100, currency: USD }, scope: LINE_ITEM }] }, idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf" })
    def create(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders"
end
      square.rb::CreateOrderResponse.from_json(json_object: response.body)
    end
# Retrieves a set of [orders](entity:Order) by their IDs.
#  If a given order ID does not exist, the ID is ignored instead of generating an
#  error.
    #
    # @param location_id [String] The ID of the location for these orders. This field is optional: omit it to
#  retrieve
#  orders within the scope of the current authorization's merchant ID.
    # @param order_ids [Array<String>] The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per
#  request.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BatchGetOrdersResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.batch_get(location_id: "057P5VYJ4A5X1", order_ids: ["CAISEM82RcpmcFBM0TfOyiHV3es", "CAISENgvlJ6jLWAzERDzjyHVybY"])
    def batch_get(location_id: nil, order_ids:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_id: location_id, order_ids: order_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/batch-retrieve"
end
      square.rb::BatchGetOrdersResponse.from_json(json_object: response.body)
    end
# Enables applications to preview order pricing without creating an order.
    #
    # @param order [Hash] The order to be calculated. Expects the entire order, not a sparse update.Request of type square.rb::Order, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :reference_id (String) 
    #   * :source (Hash)
    #     * :name (String) 
    #   * :customer_id (String) 
    #   * :line_items (Array<square.rb::OrderLineItem>) 
    #   * :taxes (Array<square.rb::OrderLineItemTax>) 
    #   * :discounts (Array<square.rb::OrderLineItemDiscount>) 
    #   * :service_charges (Array<square.rb::OrderServiceCharge>) 
    #   * :fulfillments (Array<square.rb::Fulfillment>) 
    #   * :returns (Array<square.rb::OrderReturn>) 
    #   * :return_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :net_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :rounding_adjustment (Hash)
    #     * :uid (String) 
    #     * :name (String) 
    #     * :amount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :tenders (Array<square.rb::Tender>) 
    #   * :refunds (Array<square.rb::Refund>) 
    #   * :metadata (Hash{String => String}) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :closed_at (String) 
    #   * :state (square.rb::OrderState) 
    #   * :version (Integer) 
    #   * :total_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tax_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_discount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_service_charge_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :ticket_name (String) 
    #   * :pricing_options (Hash)
    #     * :auto_apply_discounts (Boolean) 
    #     * :auto_apply_taxes (Boolean) 
    #   * :rewards (Array<square.rb::OrderReward>) 
    #   * :net_amount_due_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param proposed_rewards [Array<Hash>] Identifies one or more loyalty reward tiers to apply during the order
#  calculation.
#  The discounts defined by the reward tiers are added to the order only to preview
#  the
#  effect of applying the specified rewards. The rewards do not correspond to
#  actual
#  redemptions; that is, no `reward`s are created. Therefore, the reward `id`s are
#  random strings used only to reference the reward tier.Request of type Array<square.rb::OrderReward>, as a Hash
    #   * :id (String) 
    #   * :reward_tier_id (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CalculateOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.calculate(order: { location_id: "D7AVYMEAPJ3A3", line_items: [{ name: "Item 1", quantity: "1", base_price_money: { amount: 500, currency: USD } }, { name: "Item 2", quantity: "2", base_price_money: { amount: 300, currency: USD } }], discounts: [{ name: "50% Off", percentage: "50", scope: ORDER }] })
    def calculate(order:, proposed_rewards: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order: order, proposed_rewards: proposed_rewards }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/calculate"
end
      square.rb::CalculateOrderResponse.from_json(json_object: response.body)
    end
# Creates a new order, in the `DRAFT` state, by duplicating an existing order. The
#  newly created order has
#  only the core fields (such as line items, taxes, and discounts) copied from the
#  original order.
    #
    # @param order_id [String] The ID of the order to clone.
    # @param version [Integer] An optional order version for concurrency protection.
#  If a version is provided, it must match the latest stored version of the order
#  to clone.
#  If a version is not provided, the API clones the latest version.
    # @param idempotency_key [String] A value you specify that uniquely identifies this clone request.
#  If you are unsure whether a particular order was cloned successfully,
#  you can reattempt the call with the same idempotency key without
#  worrying about creating duplicate cloned orders.
#  The originally cloned order is returned.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CloneOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.clone(
#    order_id: "ZAISEM52YcpmcWAzERDOyiWS123",
#    version: 3,
#    idempotency_key: "UNIQUE_STRING"
#  )
    def clone(order_id:, version: nil, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order_id: order_id, version: version, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/clone"
end
      square.rb::CloneOrderResponse.from_json(json_object: response.body)
    end
# Search all orders for one or more locations. Orders include all sales,
#  returns, and exchanges regardless of how or when they entered the Square
#  ecosystem (such as Point of Sale, Invoices, and Connect APIs).
#  `SearchOrders` requests need to specify which locations to search and define a
#  [SearchOrdersQuery](entity:SearchOrdersQuery) object that controls
#  how to sort or filter the results. Your `SearchOrdersQuery` can:
#  Set filter criteria.
#  Set the sort order.
#  Determine whether to return results as complete `Order` objects or as
#  [OrderEntry](entity:OrderEntry) objects.
#  Note that details for orders processed with Square Point of Sale while in
#  offline mode might not be transmitted to Square for up to 72 hours. Offline
#  orders have a `created_at` value that reflects the time the order was created,
#  not the time it was subsequently transmitted to Square.
    #
    # @param location_ids [Array<String>] The location IDs for the orders to query. All locations must belong to
#  the same merchant.
#  Max: 10 location IDs.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param query [Hash] Query conditions used to filter or sort the results. Note that when
#  retrieving additional pages using a cursor, you must use the original query.Request of type square.rb::SearchOrdersQuery, as a Hash
    #   * :filter (Hash)
    #     * :state_filter (Hash)
    #       * :states (Array<square.rb::OrderState>) 
    #     * :date_time_filter (Hash)
    #       * :created_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #       * :updated_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #       * :closed_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #     * :fulfillment_filter (Hash)
    #       * :fulfillment_types (Array<square.rb::FulfillmentType>) 
    #       * :fulfillment_states (Array<square.rb::FulfillmentState>) 
    #     * :source_filter (Hash)
    #       * :source_names (Array<String>) 
    #     * :customer_filter (Hash)
    #       * :customer_ids (Array<String>) 
    #   * :sort (Hash)
    #     * :sort_field (square.rb::SearchOrdersSortField) 
    #     * :sort_order (square.rb::SortOrder) 
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  Default: `500`
#  Max: `1000`
    # @param return_entries [Boolean] A Boolean that controls the format of the search results. If `true`,
#  `SearchOrders` returns [OrderEntry](entity:OrderEntry) objects. If `false`,
#  `SearchOrders`
#  returns complete order objects.
#  Default: `false`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchOrdersResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.search(
#    location_ids: ["057P5VYJ4A5X1", "18YC4JDH91E1H"],
#    query: { filter: { state_filter: { states: [COMPLETED] }, date_time_filter: { closed_at: { start_at: "2018-03-03T20:00:00+00:00", end_at: "2019-03-04T21:54:45+00:00" } } }, sort: { sort_field: CLOSED_AT, sort_order: DESC } },
#    limit: 3,
#    return_entries: true
#  )
    def search(location_ids: nil, cursor: nil, query: nil, limit: nil, return_entries: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_ids: location_ids, cursor: cursor, query: query, limit: limit, return_entries: return_entries }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/search"
end
      square.rb::SearchOrdersResponse.from_json(json_object: response.body)
    end
# Retrieves an [Order](entity:Order) by ID.
    #
    # @param order_id [String] The ID of the order to retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.get(order_id: "order_id")
    def get(order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}"
end
      square.rb::GetOrderResponse.from_json(json_object: response.body)
    end
# Updates an open [order](entity:Order) by adding, replacing, or deleting
#  fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.
#  An `UpdateOrder` request requires the following:
#  - The `order_id` in the endpoint path, identifying the order to update.
#  - The latest `version` of the order to update.
#  - The [sparse
#  r.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
#  containing only the fields to update and the version to which the update is
#  being applied.
#  - If deleting fields, the [dot notation
#  up.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
#  identifying the fields to clear.
#  To pay for an order, see
#  [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
    #
    # @param order_id [String] The ID of the order to update.
    # @param order [Hash] The [sparse
#  r.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
#  containing only the fields to update and the version to which the update is
#  being applied.Request of type square.rb::Order, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :reference_id (String) 
    #   * :source (Hash)
    #     * :name (String) 
    #   * :customer_id (String) 
    #   * :line_items (Array<square.rb::OrderLineItem>) 
    #   * :taxes (Array<square.rb::OrderLineItemTax>) 
    #   * :discounts (Array<square.rb::OrderLineItemDiscount>) 
    #   * :service_charges (Array<square.rb::OrderServiceCharge>) 
    #   * :fulfillments (Array<square.rb::Fulfillment>) 
    #   * :returns (Array<square.rb::OrderReturn>) 
    #   * :return_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :net_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :rounding_adjustment (Hash)
    #     * :uid (String) 
    #     * :name (String) 
    #     * :amount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :tenders (Array<square.rb::Tender>) 
    #   * :refunds (Array<square.rb::Refund>) 
    #   * :metadata (Hash{String => String}) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :closed_at (String) 
    #   * :state (square.rb::OrderState) 
    #   * :version (Integer) 
    #   * :total_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tax_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_discount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_service_charge_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :ticket_name (String) 
    #   * :pricing_options (Hash)
    #     * :auto_apply_discounts (Boolean) 
    #     * :auto_apply_taxes (Boolean) 
    #   * :rewards (Array<square.rb::OrderReward>) 
    #   * :net_amount_due_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param fields_to_clear [Array<String>] The [dot notation
#  up.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
#  fields to clear. For example, `line_items[uid].note`.
#  For more information, see [Deleting
#  loper.squareup.com/docs/orders-api/manage-orders/update-orders#deleting-fields).
    # @param idempotency_key [String] A value you specify that uniquely identifies this update request.
#  If you are unsure whether a particular update was applied to an order
#  successfully,
#  you can reattempt it with the same idempotency key without
#  worrying about creating duplicate updates to the order.
#  The latest order version is returned.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.update(
#    order_id: "order_id",
#    order: { location_id: "location_id", line_items: [{ uid: "cookie_uid", name: "COOKIE", quantity: "2", base_price_money: { amount: 200, currency: USD } }], version: 1 },
#    fields_to_clear: ["discounts"],
#    idempotency_key: "UNIQUE_STRING"
#  )
    def update(order_id:, order: nil, fields_to_clear: nil, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order: order, fields_to_clear: fields_to_clear, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}"
end
      square.rb::UpdateOrderResponse.from_json(json_object: response.body)
    end
# Pay for an [order](entity:Order) using one or more approved
#  [payments](entity:Payment)
#  or settle an order with a total of `0`.
#  The total of the `payment_ids` listed in the request must be equal to the order
#  total. Orders with a total amount of `0` can be marked as paid by specifying an
#  empty
#  array of `payment_ids` in the request.
#  To be used with `PayOrder`, a payment must:
#  - Reference the order by specifying the `order_id` when [creating the
#  payment](api-endpoint:Payments-CreatePayment).
#  Any approved payments that reference the same `order_id` not specified in the
#  `payment_ids` is canceled.
#  - Be approved with [delayed
#  per.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture).
#  Using a delayed capture payment with `PayOrder` completes the approved payment.
    #
    # @param order_id [String] The ID of the order being paid.
    # @param idempotency_key [String] A value you specify that uniquely identifies this request among requests you
#  have sent. If
#  you are unsure whether a particular payment request was completed successfully,
#  you can reattempt
#  it with the same idempotency key without worrying about duplicate payments.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param order_version [Integer] The version of the order being paid. If not supplied, the latest version will be
#  paid.
    # @param payment_ids [Array<String>] The IDs of the [payments](entity:Payment) to collect.
#  The payment total must match the order total.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::PayOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.pay(
#    order_id: "order_id",
#    idempotency_key: "c043a359-7ad9-4136-82a9-c3f1d66dcbff",
#    payment_ids: ["EnZdNAlWCmfh6Mt5FMNST1o7taB", "0LRiVlbXVwe8ozu4KbZxd12mvaB"]
#  )
    def pay(order_id:, idempotency_key:, order_version: nil, payment_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, order_version: order_version, payment_ids: payment_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/pay"
end
      square.rb::PayOrderResponse.from_json(json_object: response.body)
    end
  end
  class AsyncOrdersClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client
  # @return [square.rb::Orders::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [square.rb::Orders::CustomAttributesClient] 
    attr_reader :custom_attributes


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncOrdersClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = square.rb::Orders::AsyncCustomAttributeDefinitionsClient.new(request_client: request_client)
      @custom_attributes = square.rb::Orders::AsyncCustomAttributesClient.new(request_client: request_client)
    end
# Creates a new [order](entity:Order) that can include information about products
#  for
#  purchase and settings to apply to the purchase.
#  To pay for a created order, see
#  [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
#  You can modify open orders using the
#  [UpdateOrder](api-endpoint:Orders-UpdateOrder) endpoint.
    #
    # @param request [Hash] Request of type square.rb::CreateOrderRequest, as a Hash
    #   * :order (Hash)
    #     * :id (String) 
    #     * :location_id (String) 
    #     * :reference_id (String) 
    #     * :source (Hash)
    #       * :name (String) 
    #     * :customer_id (String) 
    #     * :line_items (Array<square.rb::OrderLineItem>) 
    #     * :taxes (Array<square.rb::OrderLineItemTax>) 
    #     * :discounts (Array<square.rb::OrderLineItemDiscount>) 
    #     * :service_charges (Array<square.rb::OrderServiceCharge>) 
    #     * :fulfillments (Array<square.rb::Fulfillment>) 
    #     * :returns (Array<square.rb::OrderReturn>) 
    #     * :return_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #     * :net_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #     * :rounding_adjustment (Hash)
    #       * :uid (String) 
    #       * :name (String) 
    #       * :amount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (square.rb::Currency) 
    #     * :tenders (Array<square.rb::Tender>) 
    #     * :refunds (Array<square.rb::Refund>) 
    #     * :metadata (Hash{String => String}) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :closed_at (String) 
    #     * :state (square.rb::OrderState) 
    #     * :version (Integer) 
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :total_service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :ticket_name (String) 
    #     * :pricing_options (Hash)
    #       * :auto_apply_discounts (Boolean) 
    #       * :auto_apply_taxes (Boolean) 
    #     * :rewards (Array<square.rb::OrderReward>) 
    #     * :net_amount_due_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :idempotency_key (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.create(request: { order: { location_id: "057P5VYJ4A5X1", reference_id: "my-order-001", line_items: [{ name: "New York Strip Steak", quantity: "1", base_price_money: { amount: 1599, currency: USD } }, { quantity: "2", catalog_object_id: "BEMYCSMIJL46OCDV4KYIKXIB", modifiers: [{ catalog_object_id: "CHQX7Y4KY6N5KINJKZCFURPZ" }], applied_discounts: [{ discount_uid: "one-dollar-off" }] }], taxes: [{ uid: "state-sales-tax", name: "State Sales Tax", percentage: "9", scope: ORDER }], discounts: [{ uid: "labor-day-sale", name: "Labor Day Sale", percentage: "5", scope: ORDER }, { uid: "membership-discount", catalog_object_id: "DB7L55ZH2BGWI4H23ULIWOQ7", scope: ORDER }, { uid: "one-dollar-off", name: "Sale - $1.00 off", amount_money: { amount: 100, currency: USD }, scope: LINE_ITEM }] }, idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf" })
    def create(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders"
end
        square.rb::CreateOrderResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a set of [orders](entity:Order) by their IDs.
#  If a given order ID does not exist, the ID is ignored instead of generating an
#  error.
    #
    # @param location_id [String] The ID of the location for these orders. This field is optional: omit it to
#  retrieve
#  orders within the scope of the current authorization's merchant ID.
    # @param order_ids [Array<String>] The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per
#  request.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BatchGetOrdersResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.batch_get(location_id: "057P5VYJ4A5X1", order_ids: ["CAISEM82RcpmcFBM0TfOyiHV3es", "CAISENgvlJ6jLWAzERDzjyHVybY"])
    def batch_get(location_id: nil, order_ids:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_id: location_id, order_ids: order_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/batch-retrieve"
end
        square.rb::BatchGetOrdersResponse.from_json(json_object: response.body)
      end
    end
# Enables applications to preview order pricing without creating an order.
    #
    # @param order [Hash] The order to be calculated. Expects the entire order, not a sparse update.Request of type square.rb::Order, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :reference_id (String) 
    #   * :source (Hash)
    #     * :name (String) 
    #   * :customer_id (String) 
    #   * :line_items (Array<square.rb::OrderLineItem>) 
    #   * :taxes (Array<square.rb::OrderLineItemTax>) 
    #   * :discounts (Array<square.rb::OrderLineItemDiscount>) 
    #   * :service_charges (Array<square.rb::OrderServiceCharge>) 
    #   * :fulfillments (Array<square.rb::Fulfillment>) 
    #   * :returns (Array<square.rb::OrderReturn>) 
    #   * :return_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :net_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :rounding_adjustment (Hash)
    #     * :uid (String) 
    #     * :name (String) 
    #     * :amount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :tenders (Array<square.rb::Tender>) 
    #   * :refunds (Array<square.rb::Refund>) 
    #   * :metadata (Hash{String => String}) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :closed_at (String) 
    #   * :state (square.rb::OrderState) 
    #   * :version (Integer) 
    #   * :total_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tax_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_discount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_service_charge_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :ticket_name (String) 
    #   * :pricing_options (Hash)
    #     * :auto_apply_discounts (Boolean) 
    #     * :auto_apply_taxes (Boolean) 
    #   * :rewards (Array<square.rb::OrderReward>) 
    #   * :net_amount_due_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param proposed_rewards [Array<Hash>] Identifies one or more loyalty reward tiers to apply during the order
#  calculation.
#  The discounts defined by the reward tiers are added to the order only to preview
#  the
#  effect of applying the specified rewards. The rewards do not correspond to
#  actual
#  redemptions; that is, no `reward`s are created. Therefore, the reward `id`s are
#  random strings used only to reference the reward tier.Request of type Array<square.rb::OrderReward>, as a Hash
    #   * :id (String) 
    #   * :reward_tier_id (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CalculateOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.calculate(order: { location_id: "D7AVYMEAPJ3A3", line_items: [{ name: "Item 1", quantity: "1", base_price_money: { amount: 500, currency: USD } }, { name: "Item 2", quantity: "2", base_price_money: { amount: 300, currency: USD } }], discounts: [{ name: "50% Off", percentage: "50", scope: ORDER }] })
    def calculate(order:, proposed_rewards: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order: order, proposed_rewards: proposed_rewards }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/calculate"
end
        square.rb::CalculateOrderResponse.from_json(json_object: response.body)
      end
    end
# Creates a new order, in the `DRAFT` state, by duplicating an existing order. The
#  newly created order has
#  only the core fields (such as line items, taxes, and discounts) copied from the
#  original order.
    #
    # @param order_id [String] The ID of the order to clone.
    # @param version [Integer] An optional order version for concurrency protection.
#  If a version is provided, it must match the latest stored version of the order
#  to clone.
#  If a version is not provided, the API clones the latest version.
    # @param idempotency_key [String] A value you specify that uniquely identifies this clone request.
#  If you are unsure whether a particular order was cloned successfully,
#  you can reattempt the call with the same idempotency key without
#  worrying about creating duplicate cloned orders.
#  The originally cloned order is returned.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CloneOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.clone(
#    order_id: "ZAISEM52YcpmcWAzERDOyiWS123",
#    version: 3,
#    idempotency_key: "UNIQUE_STRING"
#  )
    def clone(order_id:, version: nil, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order_id: order_id, version: version, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/clone"
end
        square.rb::CloneOrderResponse.from_json(json_object: response.body)
      end
    end
# Search all orders for one or more locations. Orders include all sales,
#  returns, and exchanges regardless of how or when they entered the Square
#  ecosystem (such as Point of Sale, Invoices, and Connect APIs).
#  `SearchOrders` requests need to specify which locations to search and define a
#  [SearchOrdersQuery](entity:SearchOrdersQuery) object that controls
#  how to sort or filter the results. Your `SearchOrdersQuery` can:
#  Set filter criteria.
#  Set the sort order.
#  Determine whether to return results as complete `Order` objects or as
#  [OrderEntry](entity:OrderEntry) objects.
#  Note that details for orders processed with Square Point of Sale while in
#  offline mode might not be transmitted to Square for up to 72 hours. Offline
#  orders have a `created_at` value that reflects the time the order was created,
#  not the time it was subsequently transmitted to Square.
    #
    # @param location_ids [Array<String>] The location IDs for the orders to query. All locations must belong to
#  the same merchant.
#  Max: 10 location IDs.
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param query [Hash] Query conditions used to filter or sort the results. Note that when
#  retrieving additional pages using a cursor, you must use the original query.Request of type square.rb::SearchOrdersQuery, as a Hash
    #   * :filter (Hash)
    #     * :state_filter (Hash)
    #       * :states (Array<square.rb::OrderState>) 
    #     * :date_time_filter (Hash)
    #       * :created_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #       * :updated_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #       * :closed_at (Hash)
    #         * :start_at (String) 
    #         * :end_at (String) 
    #     * :fulfillment_filter (Hash)
    #       * :fulfillment_types (Array<square.rb::FulfillmentType>) 
    #       * :fulfillment_states (Array<square.rb::FulfillmentState>) 
    #     * :source_filter (Hash)
    #       * :source_names (Array<String>) 
    #     * :customer_filter (Hash)
    #       * :customer_ids (Array<String>) 
    #   * :sort (Hash)
    #     * :sort_field (square.rb::SearchOrdersSortField) 
    #     * :sort_order (square.rb::SortOrder) 
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  Default: `500`
#  Max: `1000`
    # @param return_entries [Boolean] A Boolean that controls the format of the search results. If `true`,
#  `SearchOrders` returns [OrderEntry](entity:OrderEntry) objects. If `false`,
#  `SearchOrders`
#  returns complete order objects.
#  Default: `false`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchOrdersResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.search(
#    location_ids: ["057P5VYJ4A5X1", "18YC4JDH91E1H"],
#    query: { filter: { state_filter: { states: [COMPLETED] }, date_time_filter: { closed_at: { start_at: "2018-03-03T20:00:00+00:00", end_at: "2019-03-04T21:54:45+00:00" } } }, sort: { sort_field: CLOSED_AT, sort_order: DESC } },
#    limit: 3,
#    return_entries: true
#  )
    def search(location_ids: nil, cursor: nil, query: nil, limit: nil, return_entries: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_ids: location_ids, cursor: cursor, query: query, limit: limit, return_entries: return_entries }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/search"
end
        square.rb::SearchOrdersResponse.from_json(json_object: response.body)
      end
    end
# Retrieves an [Order](entity:Order) by ID.
    #
    # @param order_id [String] The ID of the order to retrieve.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.get(order_id: "order_id")
    def get(order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}"
end
        square.rb::GetOrderResponse.from_json(json_object: response.body)
      end
    end
# Updates an open [order](entity:Order) by adding, replacing, or deleting
#  fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.
#  An `UpdateOrder` request requires the following:
#  - The `order_id` in the endpoint path, identifying the order to update.
#  - The latest `version` of the order to update.
#  - The [sparse
#  r.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
#  containing only the fields to update and the version to which the update is
#  being applied.
#  - If deleting fields, the [dot notation
#  up.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
#  identifying the fields to clear.
#  To pay for an order, see
#  [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
    #
    # @param order_id [String] The ID of the order to update.
    # @param order [Hash] The [sparse
#  r.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
#  containing only the fields to update and the version to which the update is
#  being applied.Request of type square.rb::Order, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :reference_id (String) 
    #   * :source (Hash)
    #     * :name (String) 
    #   * :customer_id (String) 
    #   * :line_items (Array<square.rb::OrderLineItem>) 
    #   * :taxes (Array<square.rb::OrderLineItemTax>) 
    #   * :discounts (Array<square.rb::OrderLineItemDiscount>) 
    #   * :service_charges (Array<square.rb::OrderServiceCharge>) 
    #   * :fulfillments (Array<square.rb::Fulfillment>) 
    #   * :returns (Array<square.rb::OrderReturn>) 
    #   * :return_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :net_amounts (Hash)
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :rounding_adjustment (Hash)
    #     * :uid (String) 
    #     * :name (String) 
    #     * :amount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :tenders (Array<square.rb::Tender>) 
    #   * :refunds (Array<square.rb::Refund>) 
    #   * :metadata (Hash{String => String}) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :closed_at (String) 
    #   * :state (square.rb::OrderState) 
    #   * :version (Integer) 
    #   * :total_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tax_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_discount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_service_charge_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :ticket_name (String) 
    #   * :pricing_options (Hash)
    #     * :auto_apply_discounts (Boolean) 
    #     * :auto_apply_taxes (Boolean) 
    #   * :rewards (Array<square.rb::OrderReward>) 
    #   * :net_amount_due_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param fields_to_clear [Array<String>] The [dot notation
#  up.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
#  fields to clear. For example, `line_items[uid].note`.
#  For more information, see [Deleting
#  loper.squareup.com/docs/orders-api/manage-orders/update-orders#deleting-fields).
    # @param idempotency_key [String] A value you specify that uniquely identifies this update request.
#  If you are unsure whether a particular update was applied to an order
#  successfully,
#  you can reattempt it with the same idempotency key without
#  worrying about creating duplicate updates to the order.
#  The latest order version is returned.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.update(
#    order_id: "order_id",
#    order: { location_id: "location_id", line_items: [{ uid: "cookie_uid", name: "COOKIE", quantity: "2", base_price_money: { amount: 200, currency: USD } }], version: 1 },
#    fields_to_clear: ["discounts"],
#    idempotency_key: "UNIQUE_STRING"
#  )
    def update(order_id:, order: nil, fields_to_clear: nil, idempotency_key: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), order: order, fields_to_clear: fields_to_clear, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}"
end
        square.rb::UpdateOrderResponse.from_json(json_object: response.body)
      end
    end
# Pay for an [order](entity:Order) using one or more approved
#  [payments](entity:Payment)
#  or settle an order with a total of `0`.
#  The total of the `payment_ids` listed in the request must be equal to the order
#  total. Orders with a total amount of `0` can be marked as paid by specifying an
#  empty
#  array of `payment_ids` in the request.
#  To be used with `PayOrder`, a payment must:
#  - Reference the order by specifying the `order_id` when [creating the
#  payment](api-endpoint:Payments-CreatePayment).
#  Any approved payments that reference the same `order_id` not specified in the
#  `payment_ids` is canceled.
#  - Be approved with [delayed
#  per.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture).
#  Using a delayed capture payment with `PayOrder` completes the approved payment.
    #
    # @param order_id [String] The ID of the order being paid.
    # @param idempotency_key [String] A value you specify that uniquely identifies this request among requests you
#  have sent. If
#  you are unsure whether a particular payment request was completed successfully,
#  you can reattempt
#  it with the same idempotency key without worrying about duplicate payments.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param order_version [Integer] The version of the order being paid. If not supplied, the latest version will be
#  paid.
    # @param payment_ids [Array<String>] The IDs of the [payments](entity:Payment) to collect.
#  The payment total must match the order total.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::PayOrderResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.orders.pay(
#    order_id: "order_id",
#    idempotency_key: "c043a359-7ad9-4136-82a9-c3f1d66dcbff",
#    payment_ids: ["EnZdNAlWCmfh6Mt5FMNST1o7taB", "0LRiVlbXVwe8ozu4KbZxd12mvaB"]
#  )
    def pay(order_id:, idempotency_key:, order_version: nil, payment_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, order_version: order_version, payment_ids: payment_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/orders/#{order_id}/pay"
end
        square.rb::PayOrderResponse.from_json(json_object: response.body)
      end
    end
  end
end