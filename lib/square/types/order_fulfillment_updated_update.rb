# frozen_string_literal: true
require_relative "fulfillment_state"
require "ostruct"
require "json"

module square.rb
# Information about fulfillment updates.
  class OrderFulfillmentUpdatedUpdate
  # @return [String] A unique ID that identifies the fulfillment only within this order.
    attr_reader :fulfillment_uid
  # @return [square.rb::FulfillmentState] The state of the fulfillment before the change.
#  The state is not populated if the fulfillment is created with this new `Order`
#  version.
    attr_reader :old_state
  # @return [square.rb::FulfillmentState] The state of the fulfillment after the change. The state might be equal to
#  `old_state` if a non-state
#  field was changed on the fulfillment (such as the tracking number).
    attr_reader :new_state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fulfillment_uid [String] A unique ID that identifies the fulfillment only within this order.
    # @param old_state [square.rb::FulfillmentState] The state of the fulfillment before the change.
#  The state is not populated if the fulfillment is created with this new `Order`
#  version.
    # @param new_state [square.rb::FulfillmentState] The state of the fulfillment after the change. The state might be equal to
#  `old_state` if a non-state
#  field was changed on the fulfillment (such as the tracking number).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderFulfillmentUpdatedUpdate]
    def initialize(fulfillment_uid: OMIT, old_state: OMIT, new_state: OMIT, additional_properties: nil)
      @fulfillment_uid = fulfillment_uid if fulfillment_uid != OMIT
      @old_state = old_state if old_state != OMIT
      @new_state = new_state if new_state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "fulfillment_uid": fulfillment_uid, "old_state": old_state, "new_state": new_state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderFulfillmentUpdatedUpdate
    #
    # @param json_object [String] 
    # @return [square.rb::OrderFulfillmentUpdatedUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      fulfillment_uid = parsed_json["fulfillment_uid"]
      old_state = parsed_json["old_state"]
      new_state = parsed_json["new_state"]
      new(
        fulfillment_uid: fulfillment_uid,
        old_state: old_state,
        new_state: new_state,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderFulfillmentUpdatedUpdate to a JSON object
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
      obj.fulfillment_uid&.is_a?(String) != false || raise("Passed value for field obj.fulfillment_uid is not the expected type, validation failed.")
      obj.old_state&.is_a?(square.rb::FulfillmentState) != false || raise("Passed value for field obj.old_state is not the expected type, validation failed.")
      obj.new_state&.is_a?(square.rb::FulfillmentState) != false || raise("Passed value for field obj.new_state is not the expected type, validation failed.")
    end
  end
end