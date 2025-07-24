# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents the arguments used to construct a new phase.
  class PhaseInput
  # @return [Long] index of phase in total subscription plan
    attr_reader :ordinal
  # @return [String] id of order to be used in billing
    attr_reader :order_template_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ordinal [Long] index of phase in total subscription plan
    # @param order_template_id [String] id of order to be used in billing
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PhaseInput]
    def initialize(ordinal:, order_template_id: OMIT, additional_properties: nil)
      @ordinal = ordinal
      @order_template_id = order_template_id if order_template_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "ordinal": ordinal, "order_template_id": order_template_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PhaseInput
    #
    # @param json_object [String] 
    # @return [square.rb::PhaseInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ordinal = parsed_json["ordinal"]
      order_template_id = parsed_json["order_template_id"]
      new(
        ordinal: ordinal,
        order_template_id: order_template_id,
        additional_properties: struct
      )
    end
# Serialize an instance of PhaseInput to a JSON object
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
      obj.ordinal.is_a?(Long) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
      obj.order_template_id&.is_a?(String) != false || raise("Passed value for field obj.order_template_id is not the expected type, validation failed.")
    end
  end
end