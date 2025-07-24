# frozen_string_literal: true
require_relative "measurement_unit"
require "ostruct"
require "json"

module SquareApiClient
# Contains the name and abbreviation for standard measurement unit.
  class StandardUnitDescription
  # @return [SquareApiClient::MeasurementUnit] Identifies the measurement unit being described.
    attr_reader :unit
  # @return [String] UI display name of the measurement unit. For example, 'Pound'.
    attr_reader :name
  # @return [String] UI display abbreviation for the measurement unit. For example, 'lb'.
    attr_reader :abbreviation
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param unit [SquareApiClient::MeasurementUnit] Identifies the measurement unit being described.
    # @param name [String] UI display name of the measurement unit. For example, 'Pound'.
    # @param abbreviation [String] UI display abbreviation for the measurement unit. For example, 'lb'.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::StandardUnitDescription]
    def initialize(unit: OMIT, name: OMIT, abbreviation: OMIT, additional_properties: nil)
      @unit = unit if unit != OMIT
      @name = name if name != OMIT
      @abbreviation = abbreviation if abbreviation != OMIT
      @additional_properties = additional_properties
      @_field_set = { "unit": unit, "name": name, "abbreviation": abbreviation }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of StandardUnitDescription
    #
    # @param json_object [String] 
    # @return [SquareApiClient::StandardUnitDescription]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["unit"].nil?
        unit = parsed_json["unit"].to_json
        unit = SquareApiClient::MeasurementUnit.from_json(json_object: unit)
      else
        unit = nil
      end
      name = parsed_json["name"]
      abbreviation = parsed_json["abbreviation"]
      new(
        unit: unit,
        name: name,
        abbreviation: abbreviation,
        additional_properties: struct
      )
    end
# Serialize an instance of StandardUnitDescription to a JSON object
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
      obj.unit.nil? || SquareApiClient::MeasurementUnit.validate_raw(obj: obj.unit)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.abbreviation&.is_a?(String) != false || raise("Passed value for field obj.abbreviation is not the expected type, validation failed.")
    end
  end
end