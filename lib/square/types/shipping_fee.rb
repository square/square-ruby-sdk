# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
  class ShippingFee
  # @return [String] The name for the shipping fee.
    attr_reader :name
  # @return [square.rb::Money] The amount and currency for the shipping fee.
    attr_reader :charge
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name for the shipping fee.
    # @param charge [square.rb::Money] The amount and currency for the shipping fee.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ShippingFee]
    def initialize(name: OMIT, charge:, additional_properties: nil)
      @name = name if name != OMIT
      @charge = charge
      @additional_properties = additional_properties
      @_field_set = { "name": name, "charge": charge }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ShippingFee
    #
    # @param json_object [String] 
    # @return [square.rb::ShippingFee]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      unless parsed_json["charge"].nil?
        charge = parsed_json["charge"].to_json
        charge = square.rb::Money.from_json(json_object: charge)
      else
        charge = nil
      end
      new(
        name: name,
        charge: charge,
        additional_properties: struct
      )
    end
# Serialize an instance of ShippingFee to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      square.rb::Money.validate_raw(obj: obj.charge)
    end
  end
end