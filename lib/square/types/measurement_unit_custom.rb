# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# The information needed to define a custom unit, provided by the seller.
  class MeasurementUnitCustom
  # @return [String] The name of the custom unit, for example "bushel".
    attr_reader :name
  # @return [String] The abbreviation of the custom unit, such as "bsh" (bushel). This appears
#  in the cart for the Point of Sale app, and in reports.
    attr_reader :abbreviation
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the custom unit, for example "bushel".
    # @param abbreviation [String] The abbreviation of the custom unit, such as "bsh" (bushel). This appears
#  in the cart for the Point of Sale app, and in reports.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::MeasurementUnitCustom]
    def initialize(name:, abbreviation:, additional_properties: nil)
      @name = name
      @abbreviation = abbreviation
      @additional_properties = additional_properties
      @_field_set = { "name": name, "abbreviation": abbreviation }
    end
# Deserialize a JSON object to an instance of MeasurementUnitCustom
    #
    # @param json_object [String] 
    # @return [square.rb::MeasurementUnitCustom]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      abbreviation = parsed_json["abbreviation"]
      new(
        name: name,
        abbreviation: abbreviation,
        additional_properties: struct
      )
    end
# Serialize an instance of MeasurementUnitCustom to a JSON object
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
      obj.abbreviation.is_a?(String) != false || raise("Passed value for field obj.abbreviation is not the expected type, validation failed.")
    end
  end
end