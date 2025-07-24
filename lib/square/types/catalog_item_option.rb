# frozen_string_literal: true
require_relative "catalog_object"
require "ostruct"
require "json"

module SquareApiClient
# A group of variations for a `CatalogItem`.
  class CatalogItemOption
  # @return [String] The item option's display name for the seller. Must be unique across
#  all item options. This is a searchable attribute for use in applicable query
#  filters.
    attr_reader :name
  # @return [String] The item option's display name for the customer. This is a searchable attribute
#  for use in applicable query filters.
    attr_reader :display_name
  # @return [String] The item option's human-readable description. Displayed in the Square
#  Point of Sale app for the seller and in the Online Store or on receipts for
#  the buyer. This is a searchable attribute for use in applicable query filters.
    attr_reader :description
  # @return [Boolean] If true, display colors for entries in `values` when present.
    attr_reader :show_colors
  # @return [Array<SquareApiClient::CatalogObject>] A list of CatalogObjects containing the
#  `CatalogItemOptionValue`s for this item.
    attr_reader :values
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The item option's display name for the seller. Must be unique across
#  all item options. This is a searchable attribute for use in applicable query
#  filters.
    # @param display_name [String] The item option's display name for the customer. This is a searchable attribute
#  for use in applicable query filters.
    # @param description [String] The item option's human-readable description. Displayed in the Square
#  Point of Sale app for the seller and in the Online Store or on receipts for
#  the buyer. This is a searchable attribute for use in applicable query filters.
    # @param show_colors [Boolean] If true, display colors for entries in `values` when present.
    # @param values [Array<SquareApiClient::CatalogObject>] A list of CatalogObjects containing the
#  `CatalogItemOptionValue`s for this item.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogItemOption]
    def initialize(name: OMIT, display_name: OMIT, description: OMIT, show_colors: OMIT, values: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @display_name = display_name if display_name != OMIT
      @description = description if description != OMIT
      @show_colors = show_colors if show_colors != OMIT
      @values = values if values != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "display_name": display_name, "description": description, "show_colors": show_colors, "values": values }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogItemOption
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogItemOption]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      display_name = parsed_json["display_name"]
      description = parsed_json["description"]
      show_colors = parsed_json["show_colors"]
      values = parsed_json["values"]&.map do | item |
  item = item.to_json
  SquareApiClient::CatalogObject.from_json(json_object: item)
end
      new(
        name: name,
        display_name: display_name,
        description: description,
        show_colors: show_colors,
        values: values,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItemOption to a JSON object
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
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.show_colors&.is_a?(Boolean) != false || raise("Passed value for field obj.show_colors is not the expected type, validation failed.")
      obj.values&.is_a?(Array) != false || raise("Passed value for field obj.values is not the expected type, validation failed.")
    end
  end
end