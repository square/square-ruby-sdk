# frozen_string_literal: true
require_relative "error"
require_relative "catalog_info_response_limits"
require_relative "standard_unit_description_group"
require "ostruct"
require "json"

module square.rb
  class CatalogInfoResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::CatalogInfoResponseLimits] Limits that apply to this API.
    attr_reader :limits
  # @return [square.rb::StandardUnitDescriptionGroup] Names and abbreviations for standard units.
    attr_reader :standard_unit_description_group
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param limits [square.rb::CatalogInfoResponseLimits] Limits that apply to this API.
    # @param standard_unit_description_group [square.rb::StandardUnitDescriptionGroup] Names and abbreviations for standard units.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogInfoResponse]
    def initialize(errors: OMIT, limits: OMIT, standard_unit_description_group: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @limits = limits if limits != OMIT
      @standard_unit_description_group = standard_unit_description_group if standard_unit_description_group != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "limits": limits, "standard_unit_description_group": standard_unit_description_group }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogInfoResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogInfoResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["limits"].nil?
        limits = parsed_json["limits"].to_json
        limits = square.rb::CatalogInfoResponseLimits.from_json(json_object: limits)
      else
        limits = nil
      end
      unless parsed_json["standard_unit_description_group"].nil?
        standard_unit_description_group = parsed_json["standard_unit_description_group"].to_json
        standard_unit_description_group = square.rb::StandardUnitDescriptionGroup.from_json(json_object: standard_unit_description_group)
      else
        standard_unit_description_group = nil
      end
      new(
        errors: errors,
        limits: limits,
        standard_unit_description_group: standard_unit_description_group,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogInfoResponse to a JSON object
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
      obj.limits.nil? || square.rb::CatalogInfoResponseLimits.validate_raw(obj: obj.limits)
      obj.standard_unit_description_group.nil? || square.rb::StandardUnitDescriptionGroup.validate_raw(obj: obj.standard_unit_description_group)
    end
  end
end