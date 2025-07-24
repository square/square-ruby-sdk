# frozen_string_literal: true
require_relative "subscription_event_subscription_event_type"
require_relative "subscription_event_info"
require_relative "phase"
require "ostruct"
require "json"

module square.rb
# Describes changes to a subscription and the subscription status.
  class SubscriptionEvent
  # @return [String] The ID of the subscription event.
    attr_reader :id
  # @return [square.rb::SubscriptionEventSubscriptionEventType] Type of the subscription event.
#  See
#  riptionEventSubscriptionEventType](#type-subscriptioneventsubscriptioneventtype)
#  for possible values
    attr_reader :subscription_event_type
  # @return [String] The `YYYY-MM-DD`-formatted date (for example, 2013-01-15) when the subscription
#  event occurred.
    attr_reader :effective_date
  # @return [Integer] The day-of-the-month the billing anchor date was changed to, if applicable.
    attr_reader :monthly_billing_anchor_date
  # @return [square.rb::SubscriptionEventInfo] Additional information about the subscription event.
    attr_reader :info
  # @return [Array<square.rb::Phase>] A list of Phases, to pass phase-specific information used in the swap.
    attr_reader :phases
  # @return [String] The ID of the subscription plan variation associated with the subscription.
    attr_reader :plan_variation_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the subscription event.
    # @param subscription_event_type [square.rb::SubscriptionEventSubscriptionEventType] Type of the subscription event.
#  See
#  riptionEventSubscriptionEventType](#type-subscriptioneventsubscriptioneventtype)
#  for possible values
    # @param effective_date [String] The `YYYY-MM-DD`-formatted date (for example, 2013-01-15) when the subscription
#  event occurred.
    # @param monthly_billing_anchor_date [Integer] The day-of-the-month the billing anchor date was changed to, if applicable.
    # @param info [square.rb::SubscriptionEventInfo] Additional information about the subscription event.
    # @param phases [Array<square.rb::Phase>] A list of Phases, to pass phase-specific information used in the swap.
    # @param plan_variation_id [String] The ID of the subscription plan variation associated with the subscription.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SubscriptionEvent]
    def initialize(id:, subscription_event_type:, effective_date:, monthly_billing_anchor_date: OMIT, info: OMIT, phases: OMIT, plan_variation_id:, additional_properties: nil)
      @id = id
      @subscription_event_type = subscription_event_type
      @effective_date = effective_date
      @monthly_billing_anchor_date = monthly_billing_anchor_date if monthly_billing_anchor_date != OMIT
      @info = info if info != OMIT
      @phases = phases if phases != OMIT
      @plan_variation_id = plan_variation_id
      @additional_properties = additional_properties
      @_field_set = { "id": id, "subscription_event_type": subscription_event_type, "effective_date": effective_date, "monthly_billing_anchor_date": monthly_billing_anchor_date, "info": info, "phases": phases, "plan_variation_id": plan_variation_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionEvent
    #
    # @param json_object [String] 
    # @return [square.rb::SubscriptionEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      subscription_event_type = parsed_json["subscription_event_type"]
      effective_date = parsed_json["effective_date"]
      monthly_billing_anchor_date = parsed_json["monthly_billing_anchor_date"]
      unless parsed_json["info"].nil?
        info = parsed_json["info"].to_json
        info = square.rb::SubscriptionEventInfo.from_json(json_object: info)
      else
        info = nil
      end
      phases = parsed_json["phases"]&.map do | item |
  item = item.to_json
  square.rb::Phase.from_json(json_object: item)
end
      plan_variation_id = parsed_json["plan_variation_id"]
      new(
        id: id,
        subscription_event_type: subscription_event_type,
        effective_date: effective_date,
        monthly_billing_anchor_date: monthly_billing_anchor_date,
        info: info,
        phases: phases,
        plan_variation_id: plan_variation_id,
        additional_properties: struct
      )
    end
# Serialize an instance of SubscriptionEvent to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.subscription_event_type.is_a?(square.rb::SubscriptionEventSubscriptionEventType) != false || raise("Passed value for field obj.subscription_event_type is not the expected type, validation failed.")
      obj.effective_date.is_a?(String) != false || raise("Passed value for field obj.effective_date is not the expected type, validation failed.")
      obj.monthly_billing_anchor_date&.is_a?(Integer) != false || raise("Passed value for field obj.monthly_billing_anchor_date is not the expected type, validation failed.")
      obj.info.nil? || square.rb::SubscriptionEventInfo.validate_raw(obj: obj.info)
      obj.phases&.is_a?(Array) != false || raise("Passed value for field obj.phases is not the expected type, validation failed.")
      obj.plan_variation_id.is_a?(String) != false || raise("Passed value for field obj.plan_variation_id is not the expected type, validation failed.")
    end
  end
end