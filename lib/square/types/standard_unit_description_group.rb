# frozen_string_literal: true
require_relative "standard_unit_description"
require "ostruct"
require "json"

module square.rb
# Group of standard measurement units.
  class StandardUnitDescriptionGroup
  # @return [Array<square.rb::StandardUnitDescription>] List of standard (non-custom) measurement units in this description group.
    attr_reader :standard_unit_descriptions
  # @return [String] IETF language tag.
    attr_reader :language_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param standard_unit_descriptions [Array<square.rb::StandardUnitDescription>] List of standard (non-custom) measurement units in this description group.
    # @param language_code [String] IETF language tag.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::StandardUnitDescriptionGroup]
    def initialize(standard_unit_descriptions: OMIT, language_code: OMIT, additional_properties: nil)
      @standard_unit_descriptions = standard_unit_descriptions if standard_unit_descriptions != OMIT
      @language_code = language_code if language_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "standard_unit_descriptions": standard_unit_descriptions, "language_code": language_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of StandardUnitDescriptionGroup
    #
    # @param json_object [String] 
    # @return [square.rb::StandardUnitDescriptionGroup]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      standard_unit_descriptions = parsed_json["standard_unit_descriptions"]&.map do | item |
  item = item.to_json
  square.rb::StandardUnitDescription.from_json(json_object: item)
end
      language_code = parsed_json["language_code"]
      new(
        standard_unit_descriptions: standard_unit_descriptions,
        language_code: language_code,
        additional_properties: struct
      )
    end
# Serialize an instance of StandardUnitDescriptionGroup to a JSON object
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
      obj.standard_unit_descriptions&.is_a?(Array) != false || raise("Passed value for field obj.standard_unit_descriptions is not the expected type, validation failed.")
      obj.language_code&.is_a?(String) != false || raise("Passed value for field obj.language_code is not the expected type, validation failed.")
    end
  end
end