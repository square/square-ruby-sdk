# frozen_string_literal: true
require_relative "range"
require "ostruct"
require "json"

module square.rb
# Supported custom attribute query expressions for calling the
#  [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
#  endpoint to search for items or item variations.
  class CustomAttributeFilter
  # @return [String] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `custom_attribute_definition_id` property value against the the specified id.
#  Exactly one of `custom_attribute_definition_id` or `key` must be specified.
    attr_reader :custom_attribute_definition_id
  # @return [String] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `key` property value against the specified key.
#  Exactly one of `custom_attribute_definition_id` or `key` must be specified.
    attr_reader :key
  # @return [String] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `string_value`  property value against the specified text.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    attr_reader :string_filter
  # @return [square.rb::Range] A query expression to filter items or item variations with their custom
#  attributes
#  containing a number value within the specified range.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    attr_reader :number_filter
  # @return [Array<String>] A query expression to filter items or item variations by matching  their custom
#  attributes'
#  `selection_uid_values` values against the specified selection uids.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    attr_reader :selection_uids_filter
  # @return [Boolean] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `boolean_value` property values against the specified Boolean expression.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    attr_reader :bool_filter
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param custom_attribute_definition_id [String] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `custom_attribute_definition_id` property value against the the specified id.
#  Exactly one of `custom_attribute_definition_id` or `key` must be specified.
    # @param key [String] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `key` property value against the specified key.
#  Exactly one of `custom_attribute_definition_id` or `key` must be specified.
    # @param string_filter [String] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `string_value`  property value against the specified text.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    # @param number_filter [square.rb::Range] A query expression to filter items or item variations with their custom
#  attributes
#  containing a number value within the specified range.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    # @param selection_uids_filter [Array<String>] A query expression to filter items or item variations by matching  their custom
#  attributes'
#  `selection_uid_values` values against the specified selection uids.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    # @param bool_filter [Boolean] A query expression to filter items or item variations by matching their custom
#  attributes'
#  `boolean_value` property values against the specified Boolean expression.
#  Exactly one of `string_filter`, `number_filter`, `selection_uids_filter`, or
#  `bool_filter` must be specified.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomAttributeFilter]
    def initialize(custom_attribute_definition_id: OMIT, key: OMIT, string_filter: OMIT, number_filter: OMIT, selection_uids_filter: OMIT, bool_filter: OMIT, additional_properties: nil)
      @custom_attribute_definition_id = custom_attribute_definition_id if custom_attribute_definition_id != OMIT
      @key = key if key != OMIT
      @string_filter = string_filter if string_filter != OMIT
      @number_filter = number_filter if number_filter != OMIT
      @selection_uids_filter = selection_uids_filter if selection_uids_filter != OMIT
      @bool_filter = bool_filter if bool_filter != OMIT
      @additional_properties = additional_properties
      @_field_set = { "custom_attribute_definition_id": custom_attribute_definition_id, "key": key, "string_filter": string_filter, "number_filter": number_filter, "selection_uids_filter": selection_uids_filter, "bool_filter": bool_filter }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomAttributeFilter
    #
    # @param json_object [String] 
    # @return [square.rb::CustomAttributeFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      custom_attribute_definition_id = parsed_json["custom_attribute_definition_id"]
      key = parsed_json["key"]
      string_filter = parsed_json["string_filter"]
      unless parsed_json["number_filter"].nil?
        number_filter = parsed_json["number_filter"].to_json
        number_filter = square.rb::Range.from_json(json_object: number_filter)
      else
        number_filter = nil
      end
      selection_uids_filter = parsed_json["selection_uids_filter"]
      bool_filter = parsed_json["bool_filter"]
      new(
        custom_attribute_definition_id: custom_attribute_definition_id,
        key: key,
        string_filter: string_filter,
        number_filter: number_filter,
        selection_uids_filter: selection_uids_filter,
        bool_filter: bool_filter,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomAttributeFilter to a JSON object
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
      obj.custom_attribute_definition_id&.is_a?(String) != false || raise("Passed value for field obj.custom_attribute_definition_id is not the expected type, validation failed.")
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.string_filter&.is_a?(String) != false || raise("Passed value for field obj.string_filter is not the expected type, validation failed.")
      obj.number_filter.nil? || square.rb::Range.validate_raw(obj: obj.number_filter)
      obj.selection_uids_filter&.is_a?(Array) != false || raise("Passed value for field obj.selection_uids_filter is not the expected type, validation failed.")
      obj.bool_filter&.is_a?(Boolean) != false || raise("Passed value for field obj.bool_filter is not the expected type, validation failed.")
    end
  end
end