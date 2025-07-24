# frozen_string_literal: true
require_relative "subscription_status"
require_relative "money"
require_relative "subscription_source"
require_relative "subscription_action"
require_relative "phase"
require "ostruct"
require "json"

module square.rb
# Represents a subscription purchased by a customer.
#  For more information, see
#  [Manage
#  ns](https://developer.squareup.com/docs/subscriptions-api/manage-subscriptions).
  class Subscription
  # @return [String] The Square-assigned ID of the subscription.
    attr_reader :id
  # @return [String] The ID of the location associated with the subscription.
    attr_reader :location_id
  # @return [String] The ID of the subscribed-to [subscription plan
#  variation](entity:CatalogSubscriptionPlanVariation).
    attr_reader :plan_variation_id
  # @return [String] The ID of the subscribing [customer](entity:Customer) profile.
    attr_reader :customer_id
  # @return [String] The `YYYY-MM-DD`-formatted date (for example, 2013-01-15) to start the
#  subscription.
    attr_reader :start_date
  # @return [String] The `YYYY-MM-DD`-formatted date (for example, 2013-01-15) to cancel the
#  subscription,
#  when the subscription status changes to `CANCELED` and the subscription billing
#  stops.
#  If this field is not set, the subscription ends according its subscription plan.
#  This field cannot be updated, other than being cleared.
    attr_reader :canceled_date
  # @return [String] The `YYYY-MM-DD`-formatted date up to when the subscriber is invoiced for the
#  subscription.
#  After the invoice is sent for a given billing period,
#  this date will be the last day of the billing period.
#  For example,
#  suppose for the month of May a subscriber gets an invoice
#  (or charged the card) on May 1. For the monthly billing scenario,
#  this date is then set to May 31.
    attr_reader :charged_through_date
  # @return [square.rb::SubscriptionStatus] The current status of the subscription.
#  See [SubscriptionStatus](#type-subscriptionstatus) for possible values
    attr_reader :status
  # @return [String] The tax amount applied when billing the subscription. The
#  percentage is expressed in decimal form, using a `'.'` as the decimal
#  separator and without a `'%'` sign. For example, a value of `7.5`
#  corresponds to 7.5%.
    attr_reader :tax_percentage
  # @return [Array<String>] The IDs of the [invoices](entity:Invoice) created for the
#  subscription, listed in order when the invoices were created
#  (newest invoices appear first).
    attr_reader :invoice_ids
  # @return [square.rb::Money] A custom price which overrides the cost of a subscription plan variation with
#  `STATIC` pricing.
#  This field does not affect itemized subscriptions with `RELATIVE` pricing.
#  Instead,
#  you should edit the Subscription's [order
#  eup.com/docs/subscriptions-api/manage-subscriptions#phases-and-order-templates).
    attr_reader :price_override_money
  # @return [Long] The version of the object. When updating an object, the version
#  supplied must match the version in the database, otherwise the write will
#  be rejected as conflicting.
    attr_reader :version
  # @return [String] The timestamp when the subscription was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The ID of the [subscriber's](entity:Customer) [card](entity:Card)
#  used to charge for the subscription.
    attr_reader :card_id
  # @return [String] Timezone that will be used in date calculations for the subscription.
#  Defaults to the timezone of the location based on `location_id`.
#  Format: the IANA Timezone Database identifier for the location timezone (for
#  example, `America/Los_Angeles`).
    attr_reader :timezone
  # @return [square.rb::SubscriptionSource] The origination details of the subscription.
    attr_reader :source
  # @return [Array<square.rb::SubscriptionAction>] The list of scheduled actions on this subscription. It is set only in the
#  response from
#  [RetrieveSubscription](api-endpoint:Subscriptions-RetrieveSubscription) with the
#  query parameter
#  of `include=actions` or from
#  [SearchSubscriptions](api-endpoint:Subscriptions-SearchSubscriptions) with the
#  input parameter
#  of `include:["actions"]`.
    attr_reader :actions
  # @return [Integer] The day of the month on which the subscription will issue invoices and publish
#  orders.
    attr_reader :monthly_billing_anchor_date
  # @return [Array<square.rb::Phase>] array of phases for this subscription
    attr_reader :phases
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the subscription.
    # @param location_id [String] The ID of the location associated with the subscription.
    # @param plan_variation_id [String] The ID of the subscribed-to [subscription plan
#  variation](entity:CatalogSubscriptionPlanVariation).
    # @param customer_id [String] The ID of the subscribing [customer](entity:Customer) profile.
    # @param start_date [String] The `YYYY-MM-DD`-formatted date (for example, 2013-01-15) to start the
#  subscription.
    # @param canceled_date [String] The `YYYY-MM-DD`-formatted date (for example, 2013-01-15) to cancel the
#  subscription,
#  when the subscription status changes to `CANCELED` and the subscription billing
#  stops.
#  If this field is not set, the subscription ends according its subscription plan.
#  This field cannot be updated, other than being cleared.
    # @param charged_through_date [String] The `YYYY-MM-DD`-formatted date up to when the subscriber is invoiced for the
#  subscription.
#  After the invoice is sent for a given billing period,
#  this date will be the last day of the billing period.
#  For example,
#  suppose for the month of May a subscriber gets an invoice
#  (or charged the card) on May 1. For the monthly billing scenario,
#  this date is then set to May 31.
    # @param status [square.rb::SubscriptionStatus] The current status of the subscription.
#  See [SubscriptionStatus](#type-subscriptionstatus) for possible values
    # @param tax_percentage [String] The tax amount applied when billing the subscription. The
#  percentage is expressed in decimal form, using a `'.'` as the decimal
#  separator and without a `'%'` sign. For example, a value of `7.5`
#  corresponds to 7.5%.
    # @param invoice_ids [Array<String>] The IDs of the [invoices](entity:Invoice) created for the
#  subscription, listed in order when the invoices were created
#  (newest invoices appear first).
    # @param price_override_money [square.rb::Money] A custom price which overrides the cost of a subscription plan variation with
#  `STATIC` pricing.
#  This field does not affect itemized subscriptions with `RELATIVE` pricing.
#  Instead,
#  you should edit the Subscription's [order
#  eup.com/docs/subscriptions-api/manage-subscriptions#phases-and-order-templates).
    # @param version [Long] The version of the object. When updating an object, the version
#  supplied must match the version in the database, otherwise the write will
#  be rejected as conflicting.
    # @param created_at [String] The timestamp when the subscription was created, in RFC 3339 format.
    # @param card_id [String] The ID of the [subscriber's](entity:Customer) [card](entity:Card)
#  used to charge for the subscription.
    # @param timezone [String] Timezone that will be used in date calculations for the subscription.
#  Defaults to the timezone of the location based on `location_id`.
#  Format: the IANA Timezone Database identifier for the location timezone (for
#  example, `America/Los_Angeles`).
    # @param source [square.rb::SubscriptionSource] The origination details of the subscription.
    # @param actions [Array<square.rb::SubscriptionAction>] The list of scheduled actions on this subscription. It is set only in the
#  response from
#  [RetrieveSubscription](api-endpoint:Subscriptions-RetrieveSubscription) with the
#  query parameter
#  of `include=actions` or from
#  [SearchSubscriptions](api-endpoint:Subscriptions-SearchSubscriptions) with the
#  input parameter
#  of `include:["actions"]`.
    # @param monthly_billing_anchor_date [Integer] The day of the month on which the subscription will issue invoices and publish
#  orders.
    # @param phases [Array<square.rb::Phase>] array of phases for this subscription
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Subscription]
    def initialize(id: OMIT, location_id: OMIT, plan_variation_id: OMIT, customer_id: OMIT, start_date: OMIT, canceled_date: OMIT, charged_through_date: OMIT, status: OMIT, tax_percentage: OMIT, invoice_ids: OMIT, price_override_money: OMIT, version: OMIT, created_at: OMIT, card_id: OMIT, timezone: OMIT, source: OMIT, actions: OMIT, monthly_billing_anchor_date: OMIT, phases: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @location_id = location_id if location_id != OMIT
      @plan_variation_id = plan_variation_id if plan_variation_id != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @start_date = start_date if start_date != OMIT
      @canceled_date = canceled_date if canceled_date != OMIT
      @charged_through_date = charged_through_date if charged_through_date != OMIT
      @status = status if status != OMIT
      @tax_percentage = tax_percentage if tax_percentage != OMIT
      @invoice_ids = invoice_ids if invoice_ids != OMIT
      @price_override_money = price_override_money if price_override_money != OMIT
      @version = version if version != OMIT
      @created_at = created_at if created_at != OMIT
      @card_id = card_id if card_id != OMIT
      @timezone = timezone if timezone != OMIT
      @source = source if source != OMIT
      @actions = actions if actions != OMIT
      @monthly_billing_anchor_date = monthly_billing_anchor_date if monthly_billing_anchor_date != OMIT
      @phases = phases if phases != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "location_id": location_id, "plan_variation_id": plan_variation_id, "customer_id": customer_id, "start_date": start_date, "canceled_date": canceled_date, "charged_through_date": charged_through_date, "status": status, "tax_percentage": tax_percentage, "invoice_ids": invoice_ids, "price_override_money": price_override_money, "version": version, "created_at": created_at, "card_id": card_id, "timezone": timezone, "source": source, "actions": actions, "monthly_billing_anchor_date": monthly_billing_anchor_date, "phases": phases }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Subscription
    #
    # @param json_object [String] 
    # @return [square.rb::Subscription]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      location_id = parsed_json["location_id"]
      plan_variation_id = parsed_json["plan_variation_id"]
      customer_id = parsed_json["customer_id"]
      start_date = parsed_json["start_date"]
      canceled_date = parsed_json["canceled_date"]
      charged_through_date = parsed_json["charged_through_date"]
      status = parsed_json["status"]
      tax_percentage = parsed_json["tax_percentage"]
      invoice_ids = parsed_json["invoice_ids"]
      unless parsed_json["price_override_money"].nil?
        price_override_money = parsed_json["price_override_money"].to_json
        price_override_money = square.rb::Money.from_json(json_object: price_override_money)
      else
        price_override_money = nil
      end
      version = parsed_json["version"]
      created_at = parsed_json["created_at"]
      card_id = parsed_json["card_id"]
      timezone = parsed_json["timezone"]
      unless parsed_json["source"].nil?
        source = parsed_json["source"].to_json
        source = square.rb::SubscriptionSource.from_json(json_object: source)
      else
        source = nil
      end
      actions = parsed_json["actions"]&.map do | item |
  item = item.to_json
  square.rb::SubscriptionAction.from_json(json_object: item)
end
      monthly_billing_anchor_date = parsed_json["monthly_billing_anchor_date"]
      phases = parsed_json["phases"]&.map do | item |
  item = item.to_json
  square.rb::Phase.from_json(json_object: item)
end
      new(
        id: id,
        location_id: location_id,
        plan_variation_id: plan_variation_id,
        customer_id: customer_id,
        start_date: start_date,
        canceled_date: canceled_date,
        charged_through_date: charged_through_date,
        status: status,
        tax_percentage: tax_percentage,
        invoice_ids: invoice_ids,
        price_override_money: price_override_money,
        version: version,
        created_at: created_at,
        card_id: card_id,
        timezone: timezone,
        source: source,
        actions: actions,
        monthly_billing_anchor_date: monthly_billing_anchor_date,
        phases: phases,
        additional_properties: struct
      )
    end
# Serialize an instance of Subscription to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.plan_variation_id&.is_a?(String) != false || raise("Passed value for field obj.plan_variation_id is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.start_date&.is_a?(String) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
      obj.canceled_date&.is_a?(String) != false || raise("Passed value for field obj.canceled_date is not the expected type, validation failed.")
      obj.charged_through_date&.is_a?(String) != false || raise("Passed value for field obj.charged_through_date is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::SubscriptionStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.tax_percentage&.is_a?(String) != false || raise("Passed value for field obj.tax_percentage is not the expected type, validation failed.")
      obj.invoice_ids&.is_a?(Array) != false || raise("Passed value for field obj.invoice_ids is not the expected type, validation failed.")
      obj.price_override_money.nil? || square.rb::Money.validate_raw(obj: obj.price_override_money)
      obj.version&.is_a?(Long) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.card_id&.is_a?(String) != false || raise("Passed value for field obj.card_id is not the expected type, validation failed.")
      obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
      obj.source.nil? || square.rb::SubscriptionSource.validate_raw(obj: obj.source)
      obj.actions&.is_a?(Array) != false || raise("Passed value for field obj.actions is not the expected type, validation failed.")
      obj.monthly_billing_anchor_date&.is_a?(Integer) != false || raise("Passed value for field obj.monthly_billing_anchor_date is not the expected type, validation failed.")
      obj.phases&.is_a?(Array) != false || raise("Passed value for field obj.phases is not the expected type, validation failed.")
    end
  end
end