# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Filter events by the order associated with the event.
  class LoyaltyEventOrderFilter
  # @return [String] The ID of the [order](entity:Order) associated with the event.
    attr_reader :order_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_id [String] The ID of the [order](entity:Order) associated with the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyEventOrderFilter]
    def initialize(order_id:, additional_properties: nil)
      @order_id = order_id
      @additional_properties = additional_properties
      @_field_set = { "order_id": order_id }
    end
# Deserialize a JSON object to an instance of LoyaltyEventOrderFilter
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyEventOrderFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      order_id = parsed_json["order_id"]
      new(order_id: order_id, additional_properties: struct)
    end
# Serialize an instance of LoyaltyEventOrderFilter to a JSON object
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
      obj.order_id.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
    end
  end
end