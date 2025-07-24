# frozen_string_literal: true
require_relative "measurement_unit_custom"
require_relative "measurement_unit_area"
require_relative "measurement_unit_length"
require_relative "measurement_unit_volume"
require_relative "measurement_unit_weight"
require_relative "measurement_unit_generic"
require_relative "measurement_unit_time"
require_relative "measurement_unit_unit_type"
require "ostruct"
require "json"

module SquareApiClient
# Represents a unit of measurement to use with a quantity, such as ounces
#  or inches. Exactly one of the following fields are required: `custom_unit`,
#  `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
  class MeasurementUnit
  # @return [SquareApiClient::MeasurementUnitCustom] A custom unit of measurement defined by the seller using the Point of Sale
#  app or ad-hoc as an order line item.
    attr_reader :custom_unit
  # @return [SquareApiClient::MeasurementUnitArea] Represents a standard area unit.
#  See [MeasurementUnitArea](#type-measurementunitarea) for possible values
    attr_reader :area_unit
  # @return [SquareApiClient::MeasurementUnitLength] Represents a standard length unit.
#  See [MeasurementUnitLength](#type-measurementunitlength) for possible values
    attr_reader :length_unit
  # @return [SquareApiClient::MeasurementUnitVolume] Represents a standard volume unit.
#  See [MeasurementUnitVolume](#type-measurementunitvolume) for possible values
    attr_reader :volume_unit
  # @return [SquareApiClient::MeasurementUnitWeight] Represents a standard unit of weight or mass.
#  See [MeasurementUnitWeight](#type-measurementunitweight) for possible values
    attr_reader :weight_unit
  # @return [SquareApiClient::MEASUREMENT_UNIT_GENERIC] Reserved for API integrations that lack the ability to specify a real
#  measurement unit
#  See [MeasurementUnitGeneric](#type-measurementunitgeneric) for possible values
    attr_reader :generic_unit
  # @return [SquareApiClient::MeasurementUnitTime] Represents a standard unit of time.
#  See [MeasurementUnitTime](#type-measurementunittime) for possible values
    attr_reader :time_unit
  # @return [SquareApiClient::MeasurementUnitUnitType] Represents the type of the measurement unit.
#  See [MeasurementUnitUnitType](#type-measurementunitunittype) for possible values
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param custom_unit [SquareApiClient::MeasurementUnitCustom] A custom unit of measurement defined by the seller using the Point of Sale
#  app or ad-hoc as an order line item.
    # @param area_unit [SquareApiClient::MeasurementUnitArea] Represents a standard area unit.
#  See [MeasurementUnitArea](#type-measurementunitarea) for possible values
    # @param length_unit [SquareApiClient::MeasurementUnitLength] Represents a standard length unit.
#  See [MeasurementUnitLength](#type-measurementunitlength) for possible values
    # @param volume_unit [SquareApiClient::MeasurementUnitVolume] Represents a standard volume unit.
#  See [MeasurementUnitVolume](#type-measurementunitvolume) for possible values
    # @param weight_unit [SquareApiClient::MeasurementUnitWeight] Represents a standard unit of weight or mass.
#  See [MeasurementUnitWeight](#type-measurementunitweight) for possible values
    # @param generic_unit [SquareApiClient::MEASUREMENT_UNIT_GENERIC] Reserved for API integrations that lack the ability to specify a real
#  measurement unit
#  See [MeasurementUnitGeneric](#type-measurementunitgeneric) for possible values
    # @param time_unit [SquareApiClient::MeasurementUnitTime] Represents a standard unit of time.
#  See [MeasurementUnitTime](#type-measurementunittime) for possible values
    # @param type [SquareApiClient::MeasurementUnitUnitType] Represents the type of the measurement unit.
#  See [MeasurementUnitUnitType](#type-measurementunitunittype) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::MeasurementUnit]
    def initialize(custom_unit: OMIT, area_unit: OMIT, length_unit: OMIT, volume_unit: OMIT, weight_unit: OMIT, generic_unit: OMIT, time_unit: OMIT, type: OMIT, additional_properties: nil)
      @custom_unit = custom_unit if custom_unit != OMIT
      @area_unit = area_unit if area_unit != OMIT
      @length_unit = length_unit if length_unit != OMIT
      @volume_unit = volume_unit if volume_unit != OMIT
      @weight_unit = weight_unit if weight_unit != OMIT
      @generic_unit = generic_unit if generic_unit != OMIT
      @time_unit = time_unit if time_unit != OMIT
      @type = type if type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "custom_unit": custom_unit, "area_unit": area_unit, "length_unit": length_unit, "volume_unit": volume_unit, "weight_unit": weight_unit, "generic_unit": generic_unit, "time_unit": time_unit, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MeasurementUnit
    #
    # @param json_object [String] 
    # @return [SquareApiClient::MeasurementUnit]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["custom_unit"].nil?
        custom_unit = parsed_json["custom_unit"].to_json
        custom_unit = SquareApiClient::MeasurementUnitCustom.from_json(json_object: custom_unit)
      else
        custom_unit = nil
      end
      area_unit = parsed_json["area_unit"]
      length_unit = parsed_json["length_unit"]
      volume_unit = parsed_json["volume_unit"]
      weight_unit = parsed_json["weight_unit"]
      generic_unit = parsed_json["generic_unit"]
      time_unit = parsed_json["time_unit"]
      type = parsed_json["type"]
      new(
        custom_unit: custom_unit,
        area_unit: area_unit,
        length_unit: length_unit,
        volume_unit: volume_unit,
        weight_unit: weight_unit,
        generic_unit: generic_unit,
        time_unit: time_unit,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of MeasurementUnit to a JSON object
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
      obj.custom_unit.nil? || SquareApiClient::MeasurementUnitCustom.validate_raw(obj: obj.custom_unit)
      obj.area_unit&.is_a?(SquareApiClient::MeasurementUnitArea) != false || raise("Passed value for field obj.area_unit is not the expected type, validation failed.")
      obj.length_unit&.is_a?(SquareApiClient::MeasurementUnitLength) != false || raise("Passed value for field obj.length_unit is not the expected type, validation failed.")
      obj.volume_unit&.is_a?(SquareApiClient::MeasurementUnitVolume) != false || raise("Passed value for field obj.volume_unit is not the expected type, validation failed.")
      obj.weight_unit&.is_a?(SquareApiClient::MeasurementUnitWeight) != false || raise("Passed value for field obj.weight_unit is not the expected type, validation failed.")
      obj.generic_unit&.is_a?(String) != false || raise("Passed value for field obj.generic_unit is not the expected type, validation failed.")
      obj.time_unit&.is_a?(SquareApiClient::MeasurementUnitTime) != false || raise("Passed value for field obj.time_unit is not the expected type, validation failed.")
      obj.type&.is_a?(SquareApiClient::MeasurementUnitUnitType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end