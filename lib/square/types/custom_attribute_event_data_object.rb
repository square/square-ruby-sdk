# frozen_string_literal: true
require_relative "custom_attribute"
require "ostruct"
require "json"

module square.rb
  class CustomAttributeEventDataObject
  # @return [square.rb::CustomAttribute] The custom attribute.
    attr_reader :custom_attribute
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param custom_attribute [square.rb::CustomAttribute] The custom attribute.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomAttributeEventDataObject]
    def initialize(custom_attribute: OMIT, additional_properties: nil)
      @custom_attribute = custom_attribute if custom_attribute != OMIT
      @additional_properties = additional_properties
      @_field_set = { "custom_attribute": custom_attribute }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomAttributeEventDataObject
    #
    # @param json_object [String] 
    # @return [square.rb::CustomAttributeEventDataObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["custom_attribute"].nil?
        custom_attribute = parsed_json["custom_attribute"].to_json
        custom_attribute = square.rb::CustomAttribute.from_json(json_object: custom_attribute)
      else
        custom_attribute = nil
      end
      new(custom_attribute: custom_attribute, additional_properties: struct)
    end
# Serialize an instance of CustomAttributeEventDataObject to a JSON object
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
      obj.custom_attribute.nil? || square.rb::CustomAttribute.validate_raw(obj: obj.custom_attribute)
    end
  end
end