# frozen_string_literal: true
require_relative "catalog_custom_attribute_definition_type"
require "ostruct"
require "json"

module SquareApiClient
# An instance of a custom attribute. Custom attributes can be defined and
#  added to `ITEM` and `ITEM_VARIATION` type catalog objects.
#  [Read more about custom
#  ributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes).
  class CatalogCustomAttributeValue
  # @return [String] The name of the custom attribute.
    attr_reader :name
  # @return [String] The string value of the custom attribute.  Populated if `type` = `STRING`.
    attr_reader :string_value
  # @return [String] The id of the
#  [CatalogCustomAttributeDefinition](entity:CatalogCustomAttributeDefinition) this
#  value belongs to.
    attr_reader :custom_attribute_definition_id
  # @return [SquareApiClient::CatalogCustomAttributeDefinitionType] A copy of type from the associated `CatalogCustomAttributeDefinition`.
#  See
#  atalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype)
#  for possible values
    attr_reader :type
  # @return [String] Populated if `type` = `NUMBER`. Contains a string
#  representation of a decimal number, using a `.` as the decimal separator.
    attr_reader :number_value
  # @return [Boolean] A `true` or `false` value. Populated if `type` = `BOOLEAN`.
    attr_reader :boolean_value
  # @return [Array<String>] One or more choices from `allowed_selections`. Populated if `type` =
#  `SELECTION`.
    attr_reader :selection_uid_values
  # @return [String] If the associated `CatalogCustomAttributeDefinition` object is defined by
#  another application, this key is prefixed by the defining application ID.
#  For example, if the CatalogCustomAttributeDefinition has a key attribute of
#  "cocoa_brand" and the defining application ID is "abcd1234", this key is
#  "abcd1234:cocoa_brand"
#  when the application making the request is different from the application
#  defining the custom attribute definition. Otherwise, the key is simply
#  "cocoa_brand".
    attr_reader :key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the custom attribute.
    # @param string_value [String] The string value of the custom attribute.  Populated if `type` = `STRING`.
    # @param custom_attribute_definition_id [String] The id of the
#  [CatalogCustomAttributeDefinition](entity:CatalogCustomAttributeDefinition) this
#  value belongs to.
    # @param type [SquareApiClient::CatalogCustomAttributeDefinitionType] A copy of type from the associated `CatalogCustomAttributeDefinition`.
#  See
#  atalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype)
#  for possible values
    # @param number_value [String] Populated if `type` = `NUMBER`. Contains a string
#  representation of a decimal number, using a `.` as the decimal separator.
    # @param boolean_value [Boolean] A `true` or `false` value. Populated if `type` = `BOOLEAN`.
    # @param selection_uid_values [Array<String>] One or more choices from `allowed_selections`. Populated if `type` =
#  `SELECTION`.
    # @param key [String] If the associated `CatalogCustomAttributeDefinition` object is defined by
#  another application, this key is prefixed by the defining application ID.
#  For example, if the CatalogCustomAttributeDefinition has a key attribute of
#  "cocoa_brand" and the defining application ID is "abcd1234", this key is
#  "abcd1234:cocoa_brand"
#  when the application making the request is different from the application
#  defining the custom attribute definition. Otherwise, the key is simply
#  "cocoa_brand".
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogCustomAttributeValue]
    def initialize(name: OMIT, string_value: OMIT, custom_attribute_definition_id: OMIT, type: OMIT, number_value: OMIT, boolean_value: OMIT, selection_uid_values: OMIT, key: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @string_value = string_value if string_value != OMIT
      @custom_attribute_definition_id = custom_attribute_definition_id if custom_attribute_definition_id != OMIT
      @type = type if type != OMIT
      @number_value = number_value if number_value != OMIT
      @boolean_value = boolean_value if boolean_value != OMIT
      @selection_uid_values = selection_uid_values if selection_uid_values != OMIT
      @key = key if key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "string_value": string_value, "custom_attribute_definition_id": custom_attribute_definition_id, "type": type, "number_value": number_value, "boolean_value": boolean_value, "selection_uid_values": selection_uid_values, "key": key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogCustomAttributeValue
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogCustomAttributeValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      string_value = parsed_json["string_value"]
      custom_attribute_definition_id = parsed_json["custom_attribute_definition_id"]
      type = parsed_json["type"]
      number_value = parsed_json["number_value"]
      boolean_value = parsed_json["boolean_value"]
      selection_uid_values = parsed_json["selection_uid_values"]
      key = parsed_json["key"]
      new(
        name: name,
        string_value: string_value,
        custom_attribute_definition_id: custom_attribute_definition_id,
        type: type,
        number_value: number_value,
        boolean_value: boolean_value,
        selection_uid_values: selection_uid_values,
        key: key,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogCustomAttributeValue to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.string_value&.is_a?(String) != false || raise("Passed value for field obj.string_value is not the expected type, validation failed.")
      obj.custom_attribute_definition_id&.is_a?(String) != false || raise("Passed value for field obj.custom_attribute_definition_id is not the expected type, validation failed.")
      obj.type&.is_a?(SquareApiClient::CatalogCustomAttributeDefinitionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.number_value&.is_a?(String) != false || raise("Passed value for field obj.number_value is not the expected type, validation failed.")
      obj.boolean_value&.is_a?(Boolean) != false || raise("Passed value for field obj.boolean_value is not the expected type, validation failed.")
      obj.selection_uid_values&.is_a?(Array) != false || raise("Passed value for field obj.selection_uid_values is not the expected type, validation failed.")
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
    end
  end
end