# frozen_string_literal: true
require_relative "measurement_unit"
require "ostruct"
require "json"

module square.rb
# Represents the unit used to measure a `CatalogItemVariation` and
#  specifies the precision for decimal quantities.
  class CatalogMeasurementUnit
  # @return [square.rb::MeasurementUnit] Indicates the unit used to measure the quantity of a catalog item variation.
    attr_reader :measurement_unit
  # @return [Integer] An integer between 0 and 5 that represents the maximum number of
#  positions allowed after the decimal in quantities measured with this unit.
#  For example:
#  - if the precision is 0, the quantity can be 1, 2, 3, etc.
#  - if the precision is 1, the quantity can be 0.1, 0.2, etc.
#  - if the precision is 2, the quantity can be 0.01, 0.12, etc.
#  Default: 3
    attr_reader :precision
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param measurement_unit [square.rb::MeasurementUnit] Indicates the unit used to measure the quantity of a catalog item variation.
    # @param precision [Integer] An integer between 0 and 5 that represents the maximum number of
#  positions allowed after the decimal in quantities measured with this unit.
#  For example:
#  - if the precision is 0, the quantity can be 1, 2, 3, etc.
#  - if the precision is 1, the quantity can be 0.1, 0.2, etc.
#  - if the precision is 2, the quantity can be 0.01, 0.12, etc.
#  Default: 3
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogMeasurementUnit]
    def initialize(measurement_unit: OMIT, precision: OMIT, additional_properties: nil)
      @measurement_unit = measurement_unit if measurement_unit != OMIT
      @precision = precision if precision != OMIT
      @additional_properties = additional_properties
      @_field_set = { "measurement_unit": measurement_unit, "precision": precision }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogMeasurementUnit
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogMeasurementUnit]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["measurement_unit"].nil?
        measurement_unit = parsed_json["measurement_unit"].to_json
        measurement_unit = square.rb::MeasurementUnit.from_json(json_object: measurement_unit)
      else
        measurement_unit = nil
      end
      precision = parsed_json["precision"]
      new(
        measurement_unit: measurement_unit,
        precision: precision,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogMeasurementUnit to a JSON object
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
      obj.measurement_unit.nil? || square.rb::MeasurementUnit.validate_raw(obj: obj.measurement_unit)
      obj.precision&.is_a?(Integer) != false || raise("Passed value for field obj.precision is not the expected type, validation failed.")
    end
  end
end