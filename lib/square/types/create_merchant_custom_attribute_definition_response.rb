# frozen_string_literal: true
require_relative "custom_attribute_definition"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a
#  ](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition)
#  response.
#  Either `custom_attribute_definition` or `errors` is present in the response.
  class CreateMerchantCustomAttributeDefinitionResponse
  # @return [square.rb::CustomAttributeDefinition] The new custom attribute definition.
    attr_reader :custom_attribute_definition
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param custom_attribute_definition [square.rb::CustomAttributeDefinition] The new custom attribute definition.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateMerchantCustomAttributeDefinitionResponse]
    def initialize(custom_attribute_definition: OMIT, errors: OMIT, additional_properties: nil)
      @custom_attribute_definition = custom_attribute_definition if custom_attribute_definition != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "custom_attribute_definition": custom_attribute_definition, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CreateMerchantCustomAttributeDefinitionResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateMerchantCustomAttributeDefinitionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["custom_attribute_definition"].nil?
        custom_attribute_definition = parsed_json["custom_attribute_definition"].to_json
        custom_attribute_definition = square.rb::CustomAttributeDefinition.from_json(json_object: custom_attribute_definition)
      else
        custom_attribute_definition = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        custom_attribute_definition: custom_attribute_definition,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateMerchantCustomAttributeDefinitionResponse to a
#  JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end