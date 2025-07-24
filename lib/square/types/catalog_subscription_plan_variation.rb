# frozen_string_literal: true
require_relative "subscription_phase"
require "ostruct"
require "json"

module SquareApiClient
# Describes a subscription plan variation. A subscription plan variation
#  represents how the subscription for a product or service is sold.
#  For more information, see [Subscription Plans and
#  ns](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
  class CatalogSubscriptionPlanVariation
  # @return [String] The name of the plan variation.
    attr_reader :name
  # @return [Array<SquareApiClient::SubscriptionPhase>] A list containing each [SubscriptionPhase](entity:SubscriptionPhase) for this
#  plan variation.
    attr_reader :phases
  # @return [String] The id of the subscription plan, if there is one.
    attr_reader :subscription_plan_id
  # @return [Long] The day of the month the billing period starts.
    attr_reader :monthly_billing_anchor_date
  # @return [Boolean] Whether bills for this plan variation can be split for proration.
    attr_reader :can_prorate
  # @return [String] The ID of a "successor" plan variation to this one. If the field is set, and
#  this object is disabled at all
#  locations, it indicates that this variation is deprecated and the object
#  identified by the successor ID be used in
#  its stead.
    attr_reader :successor_plan_variation_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the plan variation.
    # @param phases [Array<SquareApiClient::SubscriptionPhase>] A list containing each [SubscriptionPhase](entity:SubscriptionPhase) for this
#  plan variation.
    # @param subscription_plan_id [String] The id of the subscription plan, if there is one.
    # @param monthly_billing_anchor_date [Long] The day of the month the billing period starts.
    # @param can_prorate [Boolean] Whether bills for this plan variation can be split for proration.
    # @param successor_plan_variation_id [String] The ID of a "successor" plan variation to this one. If the field is set, and
#  this object is disabled at all
#  locations, it indicates that this variation is deprecated and the object
#  identified by the successor ID be used in
#  its stead.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogSubscriptionPlanVariation]
    def initialize(name:, phases:, subscription_plan_id: OMIT, monthly_billing_anchor_date: OMIT, can_prorate: OMIT, successor_plan_variation_id: OMIT, additional_properties: nil)
      @name = name
      @phases = phases
      @subscription_plan_id = subscription_plan_id if subscription_plan_id != OMIT
      @monthly_billing_anchor_date = monthly_billing_anchor_date if monthly_billing_anchor_date != OMIT
      @can_prorate = can_prorate if can_prorate != OMIT
      @successor_plan_variation_id = successor_plan_variation_id if successor_plan_variation_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "phases": phases, "subscription_plan_id": subscription_plan_id, "monthly_billing_anchor_date": monthly_billing_anchor_date, "can_prorate": can_prorate, "successor_plan_variation_id": successor_plan_variation_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogSubscriptionPlanVariation
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogSubscriptionPlanVariation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      phases = parsed_json["phases"]&.map do | item |
  item = item.to_json
  SquareApiClient::SubscriptionPhase.from_json(json_object: item)
end
      subscription_plan_id = parsed_json["subscription_plan_id"]
      monthly_billing_anchor_date = parsed_json["monthly_billing_anchor_date"]
      can_prorate = parsed_json["can_prorate"]
      successor_plan_variation_id = parsed_json["successor_plan_variation_id"]
      new(
        name: name,
        phases: phases,
        subscription_plan_id: subscription_plan_id,
        monthly_billing_anchor_date: monthly_billing_anchor_date,
        can_prorate: can_prorate,
        successor_plan_variation_id: successor_plan_variation_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogSubscriptionPlanVariation to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.phases.is_a?(Array) != false || raise("Passed value for field obj.phases is not the expected type, validation failed.")
      obj.subscription_plan_id&.is_a?(String) != false || raise("Passed value for field obj.subscription_plan_id is not the expected type, validation failed.")
      obj.monthly_billing_anchor_date&.is_a?(Long) != false || raise("Passed value for field obj.monthly_billing_anchor_date is not the expected type, validation failed.")
      obj.can_prorate&.is_a?(Boolean) != false || raise("Passed value for field obj.can_prorate is not the expected type, validation failed.")
      obj.successor_plan_variation_id&.is_a?(String) != false || raise("Passed value for field obj.successor_plan_variation_id is not the expected type, validation failed.")
    end
  end
end