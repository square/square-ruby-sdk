# frozen_string_literal: true
require_relative "measurement_unit"
require "ostruct"
require "json"

module SquareApiClient
# Contains the measurement unit for a quantity and a precision that
#  specifies the number of digits after the decimal point for decimal quantities.
  class OrderQuantityUnit
  # @return [SquareApiClient::MeasurementUnit] A [MeasurementUnit](entity:MeasurementUnit) that represents the
#  unit of measure for the quantity.
    attr_reader :measurement_unit
  # @return [Integer] For non-integer quantities, represents the number of digits after the decimal
#  point that are
#  recorded for this quantity.
#  For example, a precision of 1 allows quantities such as `"1.0"` and `"1.1"`, but
#  not `"1.01"`.
#  Min: 0. Max: 5.
    attr_reader :precision
  # @return [String] The catalog object ID referencing the
#  [CatalogMeasurementUnit](entity:CatalogMeasurementUnit).
#  This field is set when this is a catalog-backed measurement unit.
    attr_reader :catalog_object_id
  # @return [Long] The version of the catalog object that this measurement unit references.
#  This field is set when this is a catalog-backed measurement unit.
    attr_reader :catalog_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param measurement_unit [SquareApiClient::MeasurementUnit] A [MeasurementUnit](entity:MeasurementUnit) that represents the
#  unit of measure for the quantity.
    # @param precision [Integer] For non-integer quantities, represents the number of digits after the decimal
#  point that are
#  recorded for this quantity.
#  For example, a precision of 1 allows quantities such as `"1.0"` and `"1.1"`, but
#  not `"1.01"`.
#  Min: 0. Max: 5.
    # @param catalog_object_id [String] The catalog object ID referencing the
#  [CatalogMeasurementUnit](entity:CatalogMeasurementUnit).
#  This field is set when this is a catalog-backed measurement unit.
    # @param catalog_version [Long] The version of the catalog object that this measurement unit references.
#  This field is set when this is a catalog-backed measurement unit.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderQuantityUnit]
    def initialize(measurement_unit: OMIT, precision: OMIT, catalog_object_id: OMIT, catalog_version: OMIT, additional_properties: nil)
      @measurement_unit = measurement_unit if measurement_unit != OMIT
      @precision = precision if precision != OMIT
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_version = catalog_version if catalog_version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "measurement_unit": measurement_unit, "precision": precision, "catalog_object_id": catalog_object_id, "catalog_version": catalog_version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderQuantityUnit
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderQuantityUnit]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["measurement_unit"].nil?
        measurement_unit = parsed_json["measurement_unit"].to_json
        measurement_unit = SquareApiClient::MeasurementUnit.from_json(json_object: measurement_unit)
      else
        measurement_unit = nil
      end
      precision = parsed_json["precision"]
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_version = parsed_json["catalog_version"]
      new(
        measurement_unit: measurement_unit,
        precision: precision,
        catalog_object_id: catalog_object_id,
        catalog_version: catalog_version,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderQuantityUnit to a JSON object
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
      obj.measurement_unit.nil? || SquareApiClient::MeasurementUnit.validate_raw(obj: obj.measurement_unit)
      obj.precision&.is_a?(Integer) != false || raise("Passed value for field obj.precision is not the expected type, validation failed.")
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_version&.is_a?(Long) != false || raise("Passed value for field obj.catalog_version is not the expected type, validation failed.")
    end
  end
end