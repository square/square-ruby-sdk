# frozen_string_literal: true
require_relative "subscription_action_type"
require_relative "phase"
require "ostruct"
require "json"

module SquareApiClient
# Represents an action as a pending change to a subscription.
  class SubscriptionAction
  # @return [String] The ID of an action scoped to a subscription.
    attr_reader :id
  # @return [SquareApiClient::SubscriptionActionType] The type of the action.
#  See [SubscriptionActionType](#type-subscriptionactiontype) for possible values
    attr_reader :type
  # @return [String] The `YYYY-MM-DD`-formatted date when the action occurs on the subscription.
    attr_reader :effective_date
  # @return [Integer] The new billing anchor day value, for a `CHANGE_BILLING_ANCHOR_DATE` action.
    attr_reader :monthly_billing_anchor_date
  # @return [Array<SquareApiClient::Phase>] A list of Phases, to pass phase-specific information used in the swap.
    attr_reader :phases
  # @return [String] The target subscription plan variation that a subscription switches to, for a
#  `SWAP_PLAN` action.
    attr_reader :new_plan_variation_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of an action scoped to a subscription.
    # @param type [SquareApiClient::SubscriptionActionType] The type of the action.
#  See [SubscriptionActionType](#type-subscriptionactiontype) for possible values
    # @param effective_date [String] The `YYYY-MM-DD`-formatted date when the action occurs on the subscription.
    # @param monthly_billing_anchor_date [Integer] The new billing anchor day value, for a `CHANGE_BILLING_ANCHOR_DATE` action.
    # @param phases [Array<SquareApiClient::Phase>] A list of Phases, to pass phase-specific information used in the swap.
    # @param new_plan_variation_id [String] The target subscription plan variation that a subscription switches to, for a
#  `SWAP_PLAN` action.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SubscriptionAction]
    def initialize(id: OMIT, type: OMIT, effective_date: OMIT, monthly_billing_anchor_date: OMIT, phases: OMIT, new_plan_variation_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @type = type if type != OMIT
      @effective_date = effective_date if effective_date != OMIT
      @monthly_billing_anchor_date = monthly_billing_anchor_date if monthly_billing_anchor_date != OMIT
      @phases = phases if phases != OMIT
      @new_plan_variation_id = new_plan_variation_id if new_plan_variation_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type, "effective_date": effective_date, "monthly_billing_anchor_date": monthly_billing_anchor_date, "phases": phases, "new_plan_variation_id": new_plan_variation_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionAction
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SubscriptionAction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      effective_date = parsed_json["effective_date"]
      monthly_billing_anchor_date = parsed_json["monthly_billing_anchor_date"]
      phases = parsed_json["phases"]&.map do | item |
  item = item.to_json
  SquareApiClient::Phase.from_json(json_object: item)
end
      new_plan_variation_id = parsed_json["new_plan_variation_id"]
      new(
        id: id,
        type: type,
        effective_date: effective_date,
        monthly_billing_anchor_date: monthly_billing_anchor_date,
        phases: phases,
        new_plan_variation_id: new_plan_variation_id,
        additional_properties: struct
      )
    end
# Serialize an instance of SubscriptionAction to a JSON object
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
      obj.type&.is_a?(SquareApiClient::SubscriptionActionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.effective_date&.is_a?(String) != false || raise("Passed value for field obj.effective_date is not the expected type, validation failed.")
      obj.monthly_billing_anchor_date&.is_a?(Integer) != false || raise("Passed value for field obj.monthly_billing_anchor_date is not the expected type, validation failed.")
      obj.phases&.is_a?(Array) != false || raise("Passed value for field obj.phases is not the expected type, validation failed.")
      obj.new_plan_variation_id&.is_a?(String) != false || raise("Passed value for field obj.new_plan_variation_id is not the expected type, validation failed.")
    end
  end
end