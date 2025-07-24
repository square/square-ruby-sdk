# frozen_string_literal: true
require_relative "custom_attribute_definition"
require "ostruct"
require "json"

module square.rb
  class CustomAttributeDefinitionEventDataObject
  # @return [square.rb::CustomAttributeDefinition] The custom attribute definition.
    attr_reader :custom_attribute_definition
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param custom_attribute_definition [square.rb::CustomAttributeDefinition] The custom attribute definition.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomAttributeDefinitionEventDataObject]
    def initialize(custom_attribute_definition: OMIT, additional_properties: nil)
      @custom_attribute_definition = custom_attribute_definition if custom_attribute_definition != OMIT
      @additional_properties = additional_properties
      @_field_set = { "custom_attribute_definition": custom_attribute_definition }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CustomAttributeDefinitionEventDataObject
    #
    # @param json_object [String] 
    # @return [square.rb::CustomAttributeDefinitionEventDataObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["custom_attribute_definition"].nil?
        custom_attribute_definition = parsed_json["custom_attribute_definition"].to_json
        custom_attribute_definition = square.rb::CustomAttributeDefinition.from_json(json_object: custom_attribute_definition)
      else
        custom_attribute_definition = nil
      end
      new(custom_attribute_definition: custom_attribute_definition, additional_properties: struct)
    end
# Serialize an instance of CustomAttributeDefinitionEventDataObject to a JSON
#  object
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
      obj.custom_attribute_definition.nil? || square.rb::CustomAttributeDefinition.validate_raw(obj: obj.custom_attribute_definition)
    end
  end
end