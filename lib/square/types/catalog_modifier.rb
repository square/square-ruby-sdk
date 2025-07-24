# frozen_string_literal: true
require_relative "money"
require_relative "modifier_location_overrides"
require "ostruct"
require "json"

module square.rb
# A modifier that can be applied to items at the time of sale. For example, a
#  cheese modifier for a burger, or a flavor modifier for a serving of ice cream.
  class CatalogModifier
  # @return [String] The modifier name.  This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    attr_reader :name
  # @return [square.rb::Money] The modifier price.
    attr_reader :price_money
  # @return [Boolean] When `true`, this modifier is selected by default when displaying the modifier
#  list.
#  This setting can be overridden at the item level using
#  `CatalogModifierListInfo.modifier_overrides`.
    attr_reader :on_by_default
  # @return [Integer] Determines where this `CatalogModifier` appears in the `CatalogModifierList`.
    attr_reader :ordinal
  # @return [String] The ID of the `CatalogModifierList` associated with this modifier.
    attr_reader :modifier_list_id
  # @return [Array<square.rb::ModifierLocationOverrides>] Location-specific price overrides.
    attr_reader :location_overrides
  # @return [String] The ID of the image associated with this `CatalogModifier` instance.
#  Currently this image is not displayed by Square, but is free to be displayed in
#  3rd party applications.
    attr_reader :image_id
  # @return [Boolean] When `true`, this modifier is hidden from online ordering channels. This setting
#  can be overridden at the item level using
#  `CatalogModifierListInfo.modifier_overrides`.
    attr_reader :hidden_online
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The modifier name.  This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    # @param price_money [square.rb::Money] The modifier price.
    # @param on_by_default [Boolean] When `true`, this modifier is selected by default when displaying the modifier
#  list.
#  This setting can be overridden at the item level using
#  `CatalogModifierListInfo.modifier_overrides`.
    # @param ordinal [Integer] Determines where this `CatalogModifier` appears in the `CatalogModifierList`.
    # @param modifier_list_id [String] The ID of the `CatalogModifierList` associated with this modifier.
    # @param location_overrides [Array<square.rb::ModifierLocationOverrides>] Location-specific price overrides.
    # @param image_id [String] The ID of the image associated with this `CatalogModifier` instance.
#  Currently this image is not displayed by Square, but is free to be displayed in
#  3rd party applications.
    # @param hidden_online [Boolean] When `true`, this modifier is hidden from online ordering channels. This setting
#  can be overridden at the item level using
#  `CatalogModifierListInfo.modifier_overrides`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogModifier]
    def initialize(name: OMIT, price_money: OMIT, on_by_default: OMIT, ordinal: OMIT, modifier_list_id: OMIT, location_overrides: OMIT, image_id: OMIT, hidden_online: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @price_money = price_money if price_money != OMIT
      @on_by_default = on_by_default if on_by_default != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @modifier_list_id = modifier_list_id if modifier_list_id != OMIT
      @location_overrides = location_overrides if location_overrides != OMIT
      @image_id = image_id if image_id != OMIT
      @hidden_online = hidden_online if hidden_online != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "price_money": price_money, "on_by_default": on_by_default, "ordinal": ordinal, "modifier_list_id": modifier_list_id, "location_overrides": location_overrides, "image_id": image_id, "hidden_online": hidden_online }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogModifier
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogModifier]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      unless parsed_json["price_money"].nil?
        price_money = parsed_json["price_money"].to_json
        price_money = square.rb::Money.from_json(json_object: price_money)
      else
        price_money = nil
      end
      on_by_default = parsed_json["on_by_default"]
      ordinal = parsed_json["ordinal"]
      modifier_list_id = parsed_json["modifier_list_id"]
      location_overrides = parsed_json["location_overrides"]&.map do | item |
  item = item.to_json
  square.rb::ModifierLocationOverrides.from_json(json_object: item)
end
      image_id = parsed_json["image_id"]
      hidden_online = parsed_json["hidden_online"]
      new(
        name: name,
        price_money: price_money,
        on_by_default: on_by_default,
        ordinal: ordinal,
        modifier_list_id: modifier_list_id,
        location_overrides: location_overrides,
        image_id: image_id,
        hidden_online: hidden_online,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogModifier to a JSON object
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
      obj.price_money.nil? || square.rb::Money.validate_raw(obj: obj.price_money)
      obj.on_by_default&.is_a?(Boolean) != false || raise("Passed value for field obj.on_by_default is not the expected type, validation failed.")
      obj.ordinal&.is_a?(Integer) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
      obj.modifier_list_id&.is_a?(String) != false || raise("Passed value for field obj.modifier_list_id is not the expected type, validation failed.")
      obj.location_overrides&.is_a?(Array) != false || raise("Passed value for field obj.location_overrides is not the expected type, validation failed.")
      obj.image_id&.is_a?(String) != false || raise("Passed value for field obj.image_id is not the expected type, validation failed.")
      obj.hidden_online&.is_a?(Boolean) != false || raise("Passed value for field obj.hidden_online is not the expected type, validation failed.")
    end
  end
end