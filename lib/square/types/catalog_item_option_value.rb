# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# An enumerated value that can link a
#  `CatalogItemVariation` to an item option as one of
#  its item option values.
  class CatalogItemOptionValue
  # @return [String] Unique ID of the associated item option.
    attr_reader :item_option_id
  # @return [String] Name of this item option value. This is a searchable attribute for use in
#  applicable query filters.
    attr_reader :name
  # @return [String] A human-readable description for the option value. This is a searchable
#  attribute for use in applicable query filters.
    attr_reader :description
  # @return [String] The HTML-supported hex color for the item option (e.g., "#ff8d4e85").
#  Only displayed if `show_colors` is enabled on the parent `ItemOption`. When
#  left unset, `color` defaults to white ("#ffffff") when `show_colors` is
#  enabled on the parent `ItemOption`.
    attr_reader :color
  # @return [Integer] Determines where this option value appears in a list of option values.
    attr_reader :ordinal
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param item_option_id [String] Unique ID of the associated item option.
    # @param name [String] Name of this item option value. This is a searchable attribute for use in
#  applicable query filters.
    # @param description [String] A human-readable description for the option value. This is a searchable
#  attribute for use in applicable query filters.
    # @param color [String] The HTML-supported hex color for the item option (e.g., "#ff8d4e85").
#  Only displayed if `show_colors` is enabled on the parent `ItemOption`. When
#  left unset, `color` defaults to white ("#ffffff") when `show_colors` is
#  enabled on the parent `ItemOption`.
    # @param ordinal [Integer] Determines where this option value appears in a list of option values.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogItemOptionValue]
    def initialize(item_option_id: OMIT, name: OMIT, description: OMIT, color: OMIT, ordinal: OMIT, additional_properties: nil)
      @item_option_id = item_option_id if item_option_id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @color = color if color != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @additional_properties = additional_properties
      @_field_set = { "item_option_id": item_option_id, "name": name, "description": description, "color": color, "ordinal": ordinal }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogItemOptionValue
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogItemOptionValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      item_option_id = parsed_json["item_option_id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      color = parsed_json["color"]
      ordinal = parsed_json["ordinal"]
      new(
        item_option_id: item_option_id,
        name: name,
        description: description,
        color: color,
        ordinal: ordinal,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItemOptionValue to a JSON object
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
      obj.item_option_id&.is_a?(String) != false || raise("Passed value for field obj.item_option_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
      obj.ordinal&.is_a?(Integer) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
    end
  end
end