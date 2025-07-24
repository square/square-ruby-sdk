# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/money"
require_relative "../types/subscription_source"
require_relative "../types/phase"
require_relative "../types/create_subscription_response"
require_relative "../types/bulk_swap_plan_response"
require_relative "../types/search_subscriptions_query"
require_relative "../types/search_subscriptions_response"
require_relative "../types/get_subscription_response"
require_relative "../types/subscription"
require_relative "../types/update_subscription_response"
require_relative "../types/delete_subscription_action_response"
require_relative "../types/change_billing_anchor_date_response"
require_relative "../types/cancel_subscription_response"
require_relative "../types/list_subscription_events_response"
require_relative "../types/change_timing"
require_relative "../types/pause_subscription_response"
require_relative "../types/resume_subscription_response"
require_relative "../types/phase_input"
require_relative "../types/swap_plan_response"
require "async"
require "async"
require "async"
require "async"
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
  class SubscriptionsClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::SubscriptionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Enrolls a customer in a subscription.
#  If you provide a card on file in the request, Square charges the card for
#  the subscription. Otherwise, Square sends an invoice to the customer's email
#  address. The subscription starts immediately, unless the request includes
#  the optional `start_date`. Each individual subscription is associated with a
#  particular location.
#  For more information, see [Create a
#  squareup.com/docs/subscriptions-api/manage-subscriptions#create-a-subscription).
    #
    # @param idempotency_key [String] A unique string that identifies this `CreateSubscription` request.
#  If you do not provide a unique string (or provide an empty string as the value),
#  the endpoint treats each request as independent.
#  For more information, see [Idempotency
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param location_id [String] The ID of the location the subscription is associated with.
    # @param plan_variation_id [String] The ID of the [subscription plan
#  eloper.squareup.com/docs/subscriptions-api/plans-and-variations#plan-variations)
#  created using the Catalog API.
    # @param customer_id [String] The ID of the [customer](entity:Customer) subscribing to the subscription plan
#  variation.
    # @param start_date [String] The `YYYY-MM-DD`-formatted date to start the subscription.
#  If it is unspecified, the subscription starts immediately.
    # @param canceled_date [String] The `YYYY-MM-DD`-formatted date when the newly created subscription is scheduled
#  for cancellation.
#  This date overrides the cancellation date set in the plan variation
#  configuration.
#  If the cancellation date is earlier than the end date of a subscription cycle,
#  the subscription stops
#  at the canceled date and the subscriber is sent a prorated invoice at the
#  beginning of the canceled cycle.
#  When the subscription plan of the newly created subscription has a fixed number
#  of cycles and the `canceled_date`
#  occurs before the subscription plan expires, the specified `canceled_date` sets
#  the date when the subscription
#  stops through the end of the last cycle.
    # @param tax_percentage [String] The tax to add when billing the subscription.
#  The percentage is expressed in decimal form, using a `'.'` as the decimal
#  separator and without a `'%'` sign. For example, a value of 7.5
#  corresponds to 7.5%.
    # @param price_override_money [Hash] A custom price which overrides the cost of a subscription plan variation with
#  `STATIC` pricing.
#  This field does not affect itemized subscriptions with `RELATIVE` pricing.
#  Instead,
#  you should edit the Subscription's [order
#  eup.com/docs/subscriptions-api/manage-subscriptions#phases-and-order-templates).Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param card_id [String] The ID of the [subscriber's](entity:Customer) [card](entity:Card) to charge.
#  If it is not specified, the subscriber receives an invoice via email with a link
#  to pay for their subscription.
    # @param timezone [String] The timezone that is used in date calculations for the subscription. If unset,
#  defaults to
#  the location timezone. If a timezone is not configured for the location,
#  defaults to "America/New_York".
#  Format: the IANA Timezone Database identifier for the location timezone. For
#  a list of time zones, see [List of tz database time
#  zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
    # @param source [Hash] The origination details of the subscription.Request of type square.rb::SubscriptionSource, as a Hash
    #   * :name (String) 
    # @param monthly_billing_anchor_date [Integer] The day-of-the-month to change the billing date to.
    # @param phases [Array<Hash>] array of phases for this subscriptionRequest of type Array<square.rb::Phase>, as a Hash
    #   * :uid (String) 
    #   * :ordinal (Long) 
    #   * :order_template_id (String) 
    #   * :plan_phase_uid (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.create(
#    idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf",
#    location_id: "S8GWD5R9QB376",
#    plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
#    customer_id: "CHFGVKYY8RSV93M5KCYTG4PN0G",
#    start_date: "2023-06-20",
#    card_id: "ccof:qy5x8hHGYsgLrp4Q4GB",
#    timezone: "America/Los_Angeles",
#    source: { name: "My Application" },
#    phases: [{ ordinal: 0, order_template_id: "U2NaowWxzXwpsZU697x7ZHOAnCNZY" }]
#  )
    def create(idempotency_key: nil, location_id:, plan_variation_id: nil, customer_id:, start_date: nil, canceled_date: nil, tax_percentage: nil, price_override_money: nil, card_id: nil, timezone: nil, source: nil, monthly_billing_anchor_date: nil, phases: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, location_id: location_id, plan_variation_id: plan_variation_id, customer_id: customer_id, start_date: start_date, canceled_date: canceled_date, tax_percentage: tax_percentage, price_override_money: price_override_money, card_id: card_id, timezone: timezone, source: source, monthly_billing_anchor_date: monthly_billing_anchor_date, phases: phases }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions"
end
      square.rb::CreateSubscriptionResponse.from_json(json_object: response.body)
    end
# Schedules a plan variation change for all active subscriptions under a given
#  plan
#  variation. For more information, see [Swap Subscription Plan
#  ns](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
    #
    # @param new_plan_variation_id [String] The ID of the new subscription plan variation.
#  This field is required.
    # @param old_plan_variation_id [String] The ID of the plan variation whose subscriptions should be swapped. Active
#  subscriptions
#  using this plan variation will be subscribed to the new plan variation on their
#  next billing
#  day.
    # @param location_id [String] The ID of the location to associate with the swapped subscriptions.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BulkSwapPlanResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.bulk_swap_plan(
#    new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
#    old_plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
#    location_id: "S8GWD5R9QB376"
#  )
    def bulk_swap_plan(new_plan_variation_id:, old_plan_variation_id:, location_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), new_plan_variation_id: new_plan_variation_id, old_plan_variation_id: old_plan_variation_id, location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/bulk-swap-plan"
end
      square.rb::BulkSwapPlanResponse.from_json(json_object: response.body)
    end
# Searches for subscriptions.
#  Results are ordered chronologically by subscription creation date. If
#  the request specifies more than one location ID,
#  the endpoint orders the result
#  by location ID, and then by creation date within each location. If no locations
#  are given
#  in the query, all locations are searched.
#  You can also optionally specify `customer_ids` to search by customer.
#  If left unset, all customers
#  associated with the specified locations are returned.
#  If the request specifies customer IDs, the endpoint orders results
#  first by location, within location by customer ID, and within
#  customer by subscription creation date.
    #
    # @param cursor [String] When the total number of resulting subscriptions exceeds the limit of a paged
#  response,
#  specify the cursor returned from a preceding response here to fetch the next set
#  of results.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The upper limit on the number of subscriptions to return
#  in a paged response.
    # @param query [Hash] A subscription query consisting of specified filtering conditions.
#  If this `query` field is unspecified, the `SearchSubscriptions` call will return
#  all subscriptions.Request of type square.rb::SearchSubscriptionsQuery, as a Hash
    #   * :filter (Hash)
    #     * :customer_ids (Array<String>) 
    #     * :location_ids (Array<String>) 
    #     * :source_names (Array<String>) 
    # @param include [Array<String>] An option to include related information in the response.
#  The supported values are:
#  - `actions`: to include scheduled actions on the targeted subscriptions.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchSubscriptionsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.search(query: { filter: { customer_ids: ["CHFGVKYY8RSV93M5KCYTG4PN0G"], location_ids: ["S8GWD5R9QB376"], source_names: ["My App"] } })
    def search(cursor: nil, limit: nil, query: nil, include: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, limit: limit, query: query, include: include }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/search"
end
      square.rb::SearchSubscriptionsResponse.from_json(json_object: response.body)
    end
# Retrieves a specific subscription.
    #
    # @param subscription_id [String] The ID of the subscription to retrieve.
    # @param include [String] A query parameter to specify related information to be included in the response.
#  The supported query parameter values are:
#  - `actions`: to include scheduled actions on the targeted subscription.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.get(subscription_id: "subscription_id")
    def get(subscription_id:, include: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "include": include }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}"
end
      square.rb::GetSubscriptionResponse.from_json(json_object: response.body)
    end
# Updates a subscription by modifying or clearing `subscription` field values.
#  To clear a field, set its value to `null`.
    #
    # @param subscription_id [String] The ID of the subscription to update.
    # @param subscription [Hash] The subscription object containing the current version, and fields to update.
#  Unset fields will be left at their current server values, and JSON `null` values
#  will
#  be treated as a request to clear the relevant data.Request of type square.rb::Subscription, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :plan_variation_id (String) 
    #   * :customer_id (String) 
    #   * :start_date (String) 
    #   * :canceled_date (String) 
    #   * :charged_through_date (String) 
    #   * :status (square.rb::SubscriptionStatus) 
    #   * :tax_percentage (String) 
    #   * :invoice_ids (Array<String>) 
    #   * :price_override_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :version (Long) 
    #   * :created_at (String) 
    #   * :card_id (String) 
    #   * :timezone (String) 
    #   * :source (Hash)
    #     * :name (String) 
    #   * :actions (Array<square.rb::SubscriptionAction>) 
    #   * :monthly_billing_anchor_date (Integer) 
    #   * :phases (Array<square.rb::Phase>) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.update(subscription_id: "subscription_id", subscription: { card_id: "{NEW CARD ID}" })
    def update(subscription_id:, subscription: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), subscription: subscription }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}"
end
      square.rb::UpdateSubscriptionResponse.from_json(json_object: response.body)
    end
# Deletes a scheduled action for a subscription.
    #
    # @param subscription_id [String] The ID of the subscription the targeted action is to act upon.
    # @param action_id [String] The ID of the targeted action to be deleted.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::DeleteSubscriptionActionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.delete_action(subscription_id: "subscription_id", action_id: "action_id")
    def delete_action(subscription_id:, action_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/actions/#{action_id}"
end
      square.rb::DeleteSubscriptionActionResponse.from_json(json_object: response.body)
    end
# Changes the [billing anchor
#  eveloper.squareup.com/docs/subscriptions-api/subscription-billing#billing-dates)
#  for a subscription.
    #
    # @param subscription_id [String] The ID of the subscription to update the billing anchor date.
    # @param monthly_billing_anchor_date [Integer] The anchor day for the billing cycle.
    # @param effective_date [String] The `YYYY-MM-DD`-formatted date when the scheduled `BILLING_ANCHOR_CHANGE`
#  action takes
#  place on the subscription.
#  When this date is unspecified or falls within the current billing cycle, the
#  billing anchor date
#  is changed immediately.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ChangeBillingAnchorDateResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.change_billing_anchor_date(subscription_id: "subscription_id", monthly_billing_anchor_date: 1)
    def change_billing_anchor_date(subscription_id:, monthly_billing_anchor_date: nil, effective_date: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), monthly_billing_anchor_date: monthly_billing_anchor_date, effective_date: effective_date }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/billing-anchor"
end
      square.rb::ChangeBillingAnchorDateResponse.from_json(json_object: response.body)
    end
# Schedules a `CANCEL` action to cancel an active subscription. This
#  sets the `canceled_date` field to the end of the active billing period. After
#  this date,
#  the subscription status changes from ACTIVE to CANCELED.
    #
    # @param subscription_id [String] The ID of the subscription to cancel.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.cancel(subscription_id: "subscription_id")
    def cancel(subscription_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/cancel"
end
      square.rb::CancelSubscriptionResponse.from_json(json_object: response.body)
    end
# Lists all
#  [events](https://developer.squareup.com/docs/subscriptions-api/actions-events)
#  for a specific subscription.
    #
    # @param subscription_id [String] The ID of the subscription to retrieve the events for.
    # @param cursor [String] When the total number of resulting subscription events exceeds the limit of a
#  paged response,
#  specify the cursor returned from a preceding response here to fetch the next set
#  of results.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The upper limit on the number of subscription events to return
#  in a paged response.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListSubscriptionEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.list_events(subscription_id: "subscription_id")
    def list_events(subscription_id:, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/events"
end
      square.rb::ListSubscriptionEventsResponse.from_json(json_object: response.body)
    end
# Schedules a `PAUSE` action to pause an active subscription.
    #
    # @param subscription_id [String] The ID of the subscription to pause.
    # @param pause_effective_date [String] The `YYYY-MM-DD`-formatted date when the scheduled `PAUSE` action takes place on
#  the subscription.
#  When this date is unspecified or falls within the current billing cycle, the
#  subscription is paused
#  on the starting date of the next billing cycle.
    # @param pause_cycle_duration [Long] The number of billing cycles the subscription will be paused before it is
#  reactivated.
#  When this is set, a `RESUME` action is also scheduled to take place on the
#  subscription at
#  the end of the specified pause cycle duration. In this case, neither
#  `resume_effective_date`
#  nor `resume_change_timing` may be specified.
    # @param resume_effective_date [String] The date when the subscription is reactivated by a scheduled `RESUME` action.
#  This date must be at least one billing cycle ahead of `pause_effective_date`.
    # @param resume_change_timing [square.rb::ChangeTiming] The timing whether the subscription is reactivated immediately or at the end of
#  the billing cycle, relative to
#  `resume_effective_date`.
#  See [ChangeTiming](#type-changetiming) for possible values
    # @param pause_reason [String] The user-provided reason to pause the subscription.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::PauseSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.pause(subscription_id: "subscription_id")
    def pause(subscription_id:, pause_effective_date: nil, pause_cycle_duration: nil, resume_effective_date: nil, resume_change_timing: nil, pause_reason: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), pause_effective_date: pause_effective_date, pause_cycle_duration: pause_cycle_duration, resume_effective_date: resume_effective_date, resume_change_timing: resume_change_timing, pause_reason: pause_reason }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/pause"
end
      square.rb::PauseSubscriptionResponse.from_json(json_object: response.body)
    end
# Schedules a `RESUME` action to resume a paused or a deactivated subscription.
    #
    # @param subscription_id [String] The ID of the subscription to resume.
    # @param resume_effective_date [String] The `YYYY-MM-DD`-formatted date when the subscription reactivated.
    # @param resume_change_timing [square.rb::ChangeTiming] The timing to resume a subscription, relative to the specified
#  `resume_effective_date` attribute value.
#  See [ChangeTiming](#type-changetiming) for possible values
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ResumeSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.resume(subscription_id: "subscription_id")
    def resume(subscription_id:, resume_effective_date: nil, resume_change_timing: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), resume_effective_date: resume_effective_date, resume_change_timing: resume_change_timing }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/resume"
end
      square.rb::ResumeSubscriptionResponse.from_json(json_object: response.body)
    end
# Schedules a `SWAP_PLAN` action to swap a subscription plan variation in an
#  existing subscription.
#  For more information, see [Swap Subscription Plan
#  ns](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
    #
    # @param subscription_id [String] The ID of the subscription to swap the subscription plan for.
    # @param new_plan_variation_id [String] The ID of the new subscription plan variation.
#  This field is required.
    # @param phases [Array<Hash>] A list of PhaseInputs, to pass phase-specific information used in the swap.Request of type Array<square.rb::PhaseInput>, as a Hash
    #   * :ordinal (Long) 
    #   * :order_template_id (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SwapPlanResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.swap_plan(
#    subscription_id: "subscription_id",
#    new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
#    phases: [{ ordinal: 0, order_template_id: "uhhnjH9osVv3shUADwaC0b3hNxQZY" }]
#  )
    def swap_plan(subscription_id:, new_plan_variation_id: nil, phases: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), new_plan_variation_id: new_plan_variation_id, phases: phases }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/swap-plan"
end
      square.rb::SwapPlanResponse.from_json(json_object: response.body)
    end
  end
  class AsyncSubscriptionsClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncSubscriptionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Enrolls a customer in a subscription.
#  If you provide a card on file in the request, Square charges the card for
#  the subscription. Otherwise, Square sends an invoice to the customer's email
#  address. The subscription starts immediately, unless the request includes
#  the optional `start_date`. Each individual subscription is associated with a
#  particular location.
#  For more information, see [Create a
#  squareup.com/docs/subscriptions-api/manage-subscriptions#create-a-subscription).
    #
    # @param idempotency_key [String] A unique string that identifies this `CreateSubscription` request.
#  If you do not provide a unique string (or provide an empty string as the value),
#  the endpoint treats each request as independent.
#  For more information, see [Idempotency
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param location_id [String] The ID of the location the subscription is associated with.
    # @param plan_variation_id [String] The ID of the [subscription plan
#  eloper.squareup.com/docs/subscriptions-api/plans-and-variations#plan-variations)
#  created using the Catalog API.
    # @param customer_id [String] The ID of the [customer](entity:Customer) subscribing to the subscription plan
#  variation.
    # @param start_date [String] The `YYYY-MM-DD`-formatted date to start the subscription.
#  If it is unspecified, the subscription starts immediately.
    # @param canceled_date [String] The `YYYY-MM-DD`-formatted date when the newly created subscription is scheduled
#  for cancellation.
#  This date overrides the cancellation date set in the plan variation
#  configuration.
#  If the cancellation date is earlier than the end date of a subscription cycle,
#  the subscription stops
#  at the canceled date and the subscriber is sent a prorated invoice at the
#  beginning of the canceled cycle.
#  When the subscription plan of the newly created subscription has a fixed number
#  of cycles and the `canceled_date`
#  occurs before the subscription plan expires, the specified `canceled_date` sets
#  the date when the subscription
#  stops through the end of the last cycle.
    # @param tax_percentage [String] The tax to add when billing the subscription.
#  The percentage is expressed in decimal form, using a `'.'` as the decimal
#  separator and without a `'%'` sign. For example, a value of 7.5
#  corresponds to 7.5%.
    # @param price_override_money [Hash] A custom price which overrides the cost of a subscription plan variation with
#  `STATIC` pricing.
#  This field does not affect itemized subscriptions with `RELATIVE` pricing.
#  Instead,
#  you should edit the Subscription's [order
#  eup.com/docs/subscriptions-api/manage-subscriptions#phases-and-order-templates).Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param card_id [String] The ID of the [subscriber's](entity:Customer) [card](entity:Card) to charge.
#  If it is not specified, the subscriber receives an invoice via email with a link
#  to pay for their subscription.
    # @param timezone [String] The timezone that is used in date calculations for the subscription. If unset,
#  defaults to
#  the location timezone. If a timezone is not configured for the location,
#  defaults to "America/New_York".
#  Format: the IANA Timezone Database identifier for the location timezone. For
#  a list of time zones, see [List of tz database time
#  zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
    # @param source [Hash] The origination details of the subscription.Request of type square.rb::SubscriptionSource, as a Hash
    #   * :name (String) 
    # @param monthly_billing_anchor_date [Integer] The day-of-the-month to change the billing date to.
    # @param phases [Array<Hash>] array of phases for this subscriptionRequest of type Array<square.rb::Phase>, as a Hash
    #   * :uid (String) 
    #   * :ordinal (Long) 
    #   * :order_template_id (String) 
    #   * :plan_phase_uid (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreateSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.create(
#    idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf",
#    location_id: "S8GWD5R9QB376",
#    plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
#    customer_id: "CHFGVKYY8RSV93M5KCYTG4PN0G",
#    start_date: "2023-06-20",
#    card_id: "ccof:qy5x8hHGYsgLrp4Q4GB",
#    timezone: "America/Los_Angeles",
#    source: { name: "My Application" },
#    phases: [{ ordinal: 0, order_template_id: "U2NaowWxzXwpsZU697x7ZHOAnCNZY" }]
#  )
    def create(idempotency_key: nil, location_id:, plan_variation_id: nil, customer_id:, start_date: nil, canceled_date: nil, tax_percentage: nil, price_override_money: nil, card_id: nil, timezone: nil, source: nil, monthly_billing_anchor_date: nil, phases: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, location_id: location_id, plan_variation_id: plan_variation_id, customer_id: customer_id, start_date: start_date, canceled_date: canceled_date, tax_percentage: tax_percentage, price_override_money: price_override_money, card_id: card_id, timezone: timezone, source: source, monthly_billing_anchor_date: monthly_billing_anchor_date, phases: phases }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions"
end
        square.rb::CreateSubscriptionResponse.from_json(json_object: response.body)
      end
    end
# Schedules a plan variation change for all active subscriptions under a given
#  plan
#  variation. For more information, see [Swap Subscription Plan
#  ns](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
    #
    # @param new_plan_variation_id [String] The ID of the new subscription plan variation.
#  This field is required.
    # @param old_plan_variation_id [String] The ID of the plan variation whose subscriptions should be swapped. Active
#  subscriptions
#  using this plan variation will be subscribed to the new plan variation on their
#  next billing
#  day.
    # @param location_id [String] The ID of the location to associate with the swapped subscriptions.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::BulkSwapPlanResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.bulk_swap_plan(
#    new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
#    old_plan_variation_id: "6JHXF3B2CW3YKHDV4XEM674H",
#    location_id: "S8GWD5R9QB376"
#  )
    def bulk_swap_plan(new_plan_variation_id:, old_plan_variation_id:, location_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), new_plan_variation_id: new_plan_variation_id, old_plan_variation_id: old_plan_variation_id, location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/bulk-swap-plan"
end
        square.rb::BulkSwapPlanResponse.from_json(json_object: response.body)
      end
    end
# Searches for subscriptions.
#  Results are ordered chronologically by subscription creation date. If
#  the request specifies more than one location ID,
#  the endpoint orders the result
#  by location ID, and then by creation date within each location. If no locations
#  are given
#  in the query, all locations are searched.
#  You can also optionally specify `customer_ids` to search by customer.
#  If left unset, all customers
#  associated with the specified locations are returned.
#  If the request specifies customer IDs, the endpoint orders results
#  first by location, within location by customer ID, and within
#  customer by subscription creation date.
    #
    # @param cursor [String] When the total number of resulting subscriptions exceeds the limit of a paged
#  response,
#  specify the cursor returned from a preceding response here to fetch the next set
#  of results.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The upper limit on the number of subscriptions to return
#  in a paged response.
    # @param query [Hash] A subscription query consisting of specified filtering conditions.
#  If this `query` field is unspecified, the `SearchSubscriptions` call will return
#  all subscriptions.Request of type square.rb::SearchSubscriptionsQuery, as a Hash
    #   * :filter (Hash)
    #     * :customer_ids (Array<String>) 
    #     * :location_ids (Array<String>) 
    #     * :source_names (Array<String>) 
    # @param include [Array<String>] An option to include related information in the response.
#  The supported values are:
#  - `actions`: to include scheduled actions on the targeted subscriptions.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchSubscriptionsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.search(query: { filter: { customer_ids: ["CHFGVKYY8RSV93M5KCYTG4PN0G"], location_ids: ["S8GWD5R9QB376"], source_names: ["My App"] } })
    def search(cursor: nil, limit: nil, query: nil, include: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, limit: limit, query: query, include: include }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/search"
end
        square.rb::SearchSubscriptionsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a specific subscription.
    #
    # @param subscription_id [String] The ID of the subscription to retrieve.
    # @param include [String] A query parameter to specify related information to be included in the response.
#  The supported query parameter values are:
#  - `actions`: to include scheduled actions on the targeted subscription.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.get(subscription_id: "subscription_id")
    def get(subscription_id:, include: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "include": include }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}"
end
        square.rb::GetSubscriptionResponse.from_json(json_object: response.body)
      end
    end
# Updates a subscription by modifying or clearing `subscription` field values.
#  To clear a field, set its value to `null`.
    #
    # @param subscription_id [String] The ID of the subscription to update.
    # @param subscription [Hash] The subscription object containing the current version, and fields to update.
#  Unset fields will be left at their current server values, and JSON `null` values
#  will
#  be treated as a request to clear the relevant data.Request of type square.rb::Subscription, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :plan_variation_id (String) 
    #   * :customer_id (String) 
    #   * :start_date (String) 
    #   * :canceled_date (String) 
    #   * :charged_through_date (String) 
    #   * :status (square.rb::SubscriptionStatus) 
    #   * :tax_percentage (String) 
    #   * :invoice_ids (Array<String>) 
    #   * :price_override_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :version (Long) 
    #   * :created_at (String) 
    #   * :card_id (String) 
    #   * :timezone (String) 
    #   * :source (Hash)
    #     * :name (String) 
    #   * :actions (Array<square.rb::SubscriptionAction>) 
    #   * :monthly_billing_anchor_date (Integer) 
    #   * :phases (Array<square.rb::Phase>) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.update(subscription_id: "subscription_id", subscription: { card_id: "{NEW CARD ID}" })
    def update(subscription_id:, subscription: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), subscription: subscription }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}"
end
        square.rb::UpdateSubscriptionResponse.from_json(json_object: response.body)
      end
    end
# Deletes a scheduled action for a subscription.
    #
    # @param subscription_id [String] The ID of the subscription the targeted action is to act upon.
    # @param action_id [String] The ID of the targeted action to be deleted.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::DeleteSubscriptionActionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.delete_action(subscription_id: "subscription_id", action_id: "action_id")
    def delete_action(subscription_id:, action_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/actions/#{action_id}"
end
        square.rb::DeleteSubscriptionActionResponse.from_json(json_object: response.body)
      end
    end
# Changes the [billing anchor
#  eveloper.squareup.com/docs/subscriptions-api/subscription-billing#billing-dates)
#  for a subscription.
    #
    # @param subscription_id [String] The ID of the subscription to update the billing anchor date.
    # @param monthly_billing_anchor_date [Integer] The anchor day for the billing cycle.
    # @param effective_date [String] The `YYYY-MM-DD`-formatted date when the scheduled `BILLING_ANCHOR_CHANGE`
#  action takes
#  place on the subscription.
#  When this date is unspecified or falls within the current billing cycle, the
#  billing anchor date
#  is changed immediately.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ChangeBillingAnchorDateResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.change_billing_anchor_date(subscription_id: "subscription_id", monthly_billing_anchor_date: 1)
    def change_billing_anchor_date(subscription_id:, monthly_billing_anchor_date: nil, effective_date: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), monthly_billing_anchor_date: monthly_billing_anchor_date, effective_date: effective_date }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/billing-anchor"
end
        square.rb::ChangeBillingAnchorDateResponse.from_json(json_object: response.body)
      end
    end
# Schedules a `CANCEL` action to cancel an active subscription. This
#  sets the `canceled_date` field to the end of the active billing period. After
#  this date,
#  the subscription status changes from ACTIVE to CANCELED.
    #
    # @param subscription_id [String] The ID of the subscription to cancel.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.cancel(subscription_id: "subscription_id")
    def cancel(subscription_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/cancel"
end
        square.rb::CancelSubscriptionResponse.from_json(json_object: response.body)
      end
    end
# Lists all
#  [events](https://developer.squareup.com/docs/subscriptions-api/actions-events)
#  for a specific subscription.
    #
    # @param subscription_id [String] The ID of the subscription to retrieve the events for.
    # @param cursor [String] When the total number of resulting subscription events exceeds the limit of a
#  paged response,
#  specify the cursor returned from a preceding response here to fetch the next set
#  of results.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The upper limit on the number of subscription events to return
#  in a paged response.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListSubscriptionEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.list_events(subscription_id: "subscription_id")
    def list_events(subscription_id:, cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/events"
end
        square.rb::ListSubscriptionEventsResponse.from_json(json_object: response.body)
      end
    end
# Schedules a `PAUSE` action to pause an active subscription.
    #
    # @param subscription_id [String] The ID of the subscription to pause.
    # @param pause_effective_date [String] The `YYYY-MM-DD`-formatted date when the scheduled `PAUSE` action takes place on
#  the subscription.
#  When this date is unspecified or falls within the current billing cycle, the
#  subscription is paused
#  on the starting date of the next billing cycle.
    # @param pause_cycle_duration [Long] The number of billing cycles the subscription will be paused before it is
#  reactivated.
#  When this is set, a `RESUME` action is also scheduled to take place on the
#  subscription at
#  the end of the specified pause cycle duration. In this case, neither
#  `resume_effective_date`
#  nor `resume_change_timing` may be specified.
    # @param resume_effective_date [String] The date when the subscription is reactivated by a scheduled `RESUME` action.
#  This date must be at least one billing cycle ahead of `pause_effective_date`.
    # @param resume_change_timing [square.rb::ChangeTiming] The timing whether the subscription is reactivated immediately or at the end of
#  the billing cycle, relative to
#  `resume_effective_date`.
#  See [ChangeTiming](#type-changetiming) for possible values
    # @param pause_reason [String] The user-provided reason to pause the subscription.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::PauseSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.pause(subscription_id: "subscription_id")
    def pause(subscription_id:, pause_effective_date: nil, pause_cycle_duration: nil, resume_effective_date: nil, resume_change_timing: nil, pause_reason: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), pause_effective_date: pause_effective_date, pause_cycle_duration: pause_cycle_duration, resume_effective_date: resume_effective_date, resume_change_timing: resume_change_timing, pause_reason: pause_reason }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/pause"
end
        square.rb::PauseSubscriptionResponse.from_json(json_object: response.body)
      end
    end
# Schedules a `RESUME` action to resume a paused or a deactivated subscription.
    #
    # @param subscription_id [String] The ID of the subscription to resume.
    # @param resume_effective_date [String] The `YYYY-MM-DD`-formatted date when the subscription reactivated.
    # @param resume_change_timing [square.rb::ChangeTiming] The timing to resume a subscription, relative to the specified
#  `resume_effective_date` attribute value.
#  See [ChangeTiming](#type-changetiming) for possible values
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ResumeSubscriptionResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.resume(subscription_id: "subscription_id")
    def resume(subscription_id:, resume_effective_date: nil, resume_change_timing: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), resume_effective_date: resume_effective_date, resume_change_timing: resume_change_timing }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/resume"
end
        square.rb::ResumeSubscriptionResponse.from_json(json_object: response.body)
      end
    end
# Schedules a `SWAP_PLAN` action to swap a subscription plan variation in an
#  existing subscription.
#  For more information, see [Swap Subscription Plan
#  ns](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
    #
    # @param subscription_id [String] The ID of the subscription to swap the subscription plan for.
    # @param new_plan_variation_id [String] The ID of the new subscription plan variation.
#  This field is required.
    # @param phases [Array<Hash>] A list of PhaseInputs, to pass phase-specific information used in the swap.Request of type Array<square.rb::PhaseInput>, as a Hash
    #   * :ordinal (Long) 
    #   * :order_template_id (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SwapPlanResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.subscriptions.swap_plan(
#    subscription_id: "subscription_id",
#    new_plan_variation_id: "FQ7CDXXWSLUJRPM3GFJSJGZ7",
#    phases: [{ ordinal: 0, order_template_id: "uhhnjH9osVv3shUADwaC0b3hNxQZY" }]
#  )
    def swap_plan(subscription_id:, new_plan_variation_id: nil, phases: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), new_plan_variation_id: new_plan_variation_id, phases: phases }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/subscriptions/#{subscription_id}/swap-plan"
end
        square.rb::SwapPlanResponse.from_json(json_object: response.body)
      end
    end
  end
end