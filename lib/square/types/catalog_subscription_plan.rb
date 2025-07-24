# frozen_string_literal: true
require_relative "subscription_phase"
require_relative "catalog_object"
require "ostruct"
require "json"

module square.rb
# Describes a subscription plan. A subscription plan represents what you want to
#  sell in a subscription model, and includes references to each of the associated
#  subscription plan variations.
#  For more information, see [Subscription Plans and
#  ns](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
  class CatalogSubscriptionPlan
  # @return [String] The name of the plan.
    attr_reader :name
  # @return [Array<square.rb::SubscriptionPhase>] A list of SubscriptionPhase containing the
#  [SubscriptionPhase](entity:SubscriptionPhase) for this plan.
#  This field it required. Not including this field will throw a
#  REQUIRED_FIELD_MISSING error
    attr_reader :phases
  # @return [Array<square.rb::CatalogObject>] The list of subscription plan variations available for this product
    attr_reader :subscription_plan_variations
  # @return [Array<String>] The list of IDs of `CatalogItems` that are eligible for subscription by this
#  SubscriptionPlan's variations.
    attr_reader :eligible_item_ids
  # @return [Array<String>] The list of IDs of `CatalogCategory` that are eligible for subscription by this
#  SubscriptionPlan's variations.
    attr_reader :eligible_category_ids
  # @return [Boolean] If true, all items in the merchant's catalog are subscribable by this
#  SubscriptionPlan.
    attr_reader :all_items
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the plan.
    # @param phases [Array<square.rb::SubscriptionPhase>] A list of SubscriptionPhase containing the
#  [SubscriptionPhase](entity:SubscriptionPhase) for this plan.
#  This field it required. Not including this field will throw a
#  REQUIRED_FIELD_MISSING error
    # @param subscription_plan_variations [Array<square.rb::CatalogObject>] The list of subscription plan variations available for this product
    # @param eligible_item_ids [Array<String>] The list of IDs of `CatalogItems` that are eligible for subscription by this
#  SubscriptionPlan's variations.
    # @param eligible_category_ids [Array<String>] The list of IDs of `CatalogCategory` that are eligible for subscription by this
#  SubscriptionPlan's variations.
    # @param all_items [Boolean] If true, all items in the merchant's catalog are subscribable by this
#  SubscriptionPlan.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogSubscriptionPlan]
    def initialize(name:, phases: OMIT, subscription_plan_variations: OMIT, eligible_item_ids: OMIT, eligible_category_ids: OMIT, all_items: OMIT, additional_properties: nil)
      @name = name
      @phases = phases if phases != OMIT
      @subscription_plan_variations = subscription_plan_variations if subscription_plan_variations != OMIT
      @eligible_item_ids = eligible_item_ids if eligible_item_ids != OMIT
      @eligible_category_ids = eligible_category_ids if eligible_category_ids != OMIT
      @all_items = all_items if all_items != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "phases": phases, "subscription_plan_variations": subscription_plan_variations, "eligible_item_ids": eligible_item_ids, "eligible_category_ids": eligible_category_ids, "all_items": all_items }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogSubscriptionPlan
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogSubscriptionPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      phases = parsed_json["phases"]&.map do | item |
  item = item.to_json
  square.rb::SubscriptionPhase.from_json(json_object: item)
end
      subscription_plan_variations = parsed_json["subscription_plan_variations"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      eligible_item_ids = parsed_json["eligible_item_ids"]
      eligible_category_ids = parsed_json["eligible_category_ids"]
      all_items = parsed_json["all_items"]
      new(
        name: name,
        phases: phases,
        subscription_plan_variations: subscription_plan_variations,
        eligible_item_ids: eligible_item_ids,
        eligible_category_ids: eligible_category_ids,
        all_items: all_items,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogSubscriptionPlan to a JSON object
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
      obj.phases&.is_a?(Array) != false || raise("Passed value for field obj.phases is not the expected type, validation failed.")
      obj.subscription_plan_variations&.is_a?(Array) != false || raise("Passed value for field obj.subscription_plan_variations is not the expected type, validation failed.")
      obj.eligible_item_ids&.is_a?(Array) != false || raise("Passed value for field obj.eligible_item_ids is not the expected type, validation failed.")
      obj.eligible_category_ids&.is_a?(Array) != false || raise("Passed value for field obj.eligible_category_ids is not the expected type, validation failed.")
      obj.all_items&.is_a?(Boolean) != false || raise("Passed value for field obj.all_items is not the expected type, validation failed.")
    end
  end
end