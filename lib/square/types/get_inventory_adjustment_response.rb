# frozen_string_literal: true
require_relative "error"
require_relative "inventory_adjustment"
require "ostruct"
require "json"

module square.rb
  class GetInventoryAdjustmentResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::InventoryAdjustment] The requested [InventoryAdjustment](entity:InventoryAdjustment).
    attr_reader :adjustment
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param adjustment [square.rb::InventoryAdjustment] The requested [InventoryAdjustment](entity:InventoryAdjustment).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetInventoryAdjustmentResponse]
    def initialize(errors: OMIT, adjustment: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @adjustment = adjustment if adjustment != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "adjustment": adjustment }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetInventoryAdjustmentResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetInventoryAdjustmentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["adjustment"].nil?
        adjustment = parsed_json["adjustment"].to_json
        adjustment = square.rb::InventoryAdjustment.from_json(json_object: adjustment)
      else
        adjustment = nil
      end
      new(
        errors: errors,
        adjustment: adjustment,
        additional_properties: struct
      )
    end
# Serialize an instance of GetInventoryAdjustmentResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.adjustment.nil? || square.rb::InventoryAdjustment.validate_raw(obj: obj.adjustment)
    end
  end
end