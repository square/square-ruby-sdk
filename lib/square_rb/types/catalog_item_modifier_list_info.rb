# frozen_string_literal: true
require_relative "catalog_modifier_override"
require "ostruct"
require "json"

module SquareApiClient
# Controls how a modifier list is applied to a specific item. This object allows
#  for item-specific customization of modifier list behavior
#  and provides the ability to override global modifier list settings.
  class CatalogItemModifierListInfo
  # @return [String] The ID of the `CatalogModifierList` controlled by this
#  `CatalogModifierListInfo`.
    attr_reader :modifier_list_id
  # @return [Array<SquareApiClient::CatalogModifierOverride>] A set of `CatalogModifierOverride` objects that override default modifier
#  settings for this item.
    attr_reader :modifier_overrides
  # @return [Integer] The minimum number of modifiers that must be selected from this modifier list.
#  Values:
#  - 0: No selection is required.
#  - -1: Default value, the attribute was not set by the client. When
#  `max_selected_modifiers` is
#  also -1, use the minimum and maximum selection values set on the
#  `CatalogItemModifierList`.
#  - &gt;0: The required minimum modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no selection required.
    attr_reader :min_selected_modifiers
  # @return [Integer] The maximum number of modifiers that can be selected.
#  Values:
#  - 0: No maximum limit.
#  - -1: Default value, the attribute was not set by the client. When
#  `min_selected_modifiers` is
#  also -1, use the minimum and maximum selection values set on the
#  `CatalogItemModifierList`.
#  - &gt;0: The maximum total modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no maximum limit.
    attr_reader :max_selected_modifiers
  # @return [Boolean] If `true`, enable this `CatalogModifierList`. The default value is `true`.
    attr_reader :enabled
  # @return [Integer] The position of this `CatalogItemModifierListInfo` object within the
#  `modifier_list_info` list applied
#  to a `CatalogItem` instance.
    attr_reader :ordinal
  # @return [Object] 
    attr_reader :allow_quantities
  # @return [Object] 
    attr_reader :is_conversational
  # @return [Object] 
    attr_reader :hidden_from_customer_override
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param modifier_list_id [String] The ID of the `CatalogModifierList` controlled by this
#  `CatalogModifierListInfo`.
    # @param modifier_overrides [Array<SquareApiClient::CatalogModifierOverride>] A set of `CatalogModifierOverride` objects that override default modifier
#  settings for this item.
    # @param min_selected_modifiers [Integer] The minimum number of modifiers that must be selected from this modifier list.
#  Values:
#  - 0: No selection is required.
#  - -1: Default value, the attribute was not set by the client. When
#  `max_selected_modifiers` is
#  also -1, use the minimum and maximum selection values set on the
#  `CatalogItemModifierList`.
#  - &gt;0: The required minimum modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no selection required.
    # @param max_selected_modifiers [Integer] The maximum number of modifiers that can be selected.
#  Values:
#  - 0: No maximum limit.
#  - -1: Default value, the attribute was not set by the client. When
#  `min_selected_modifiers` is
#  also -1, use the minimum and maximum selection values set on the
#  `CatalogItemModifierList`.
#  - &gt;0: The maximum total modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no maximum limit.
    # @param enabled [Boolean] If `true`, enable this `CatalogModifierList`. The default value is `true`.
    # @param ordinal [Integer] The position of this `CatalogItemModifierListInfo` object within the
#  `modifier_list_info` list applied
#  to a `CatalogItem` instance.
    # @param allow_quantities [Object] 
    # @param is_conversational [Object] 
    # @param hidden_from_customer_override [Object] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogItemModifierListInfo]
    def initialize(modifier_list_id:, modifier_overrides: OMIT, min_selected_modifiers: OMIT, max_selected_modifiers: OMIT, enabled: OMIT, ordinal: OMIT, allow_quantities: OMIT, is_conversational: OMIT, hidden_from_customer_override: OMIT, additional_properties: nil)
      @modifier_list_id = modifier_list_id
      @modifier_overrides = modifier_overrides if modifier_overrides != OMIT
      @min_selected_modifiers = min_selected_modifiers if min_selected_modifiers != OMIT
      @max_selected_modifiers = max_selected_modifiers if max_selected_modifiers != OMIT
      @enabled = enabled if enabled != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @allow_quantities = allow_quantities if allow_quantities != OMIT
      @is_conversational = is_conversational if is_conversational != OMIT
      @hidden_from_customer_override = hidden_from_customer_override if hidden_from_customer_override != OMIT
      @additional_properties = additional_properties
      @_field_set = { "modifier_list_id": modifier_list_id, "modifier_overrides": modifier_overrides, "min_selected_modifiers": min_selected_modifiers, "max_selected_modifiers": max_selected_modifiers, "enabled": enabled, "ordinal": ordinal, "allow_quantities": allow_quantities, "is_conversational": is_conversational, "hidden_from_customer_override": hidden_from_customer_override }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogItemModifierListInfo
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogItemModifierListInfo]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      modifier_list_id = parsed_json["modifier_list_id"]
      modifier_overrides = parsed_json["modifier_overrides"]&.map do | item |
  item = item.to_json
  SquareApiClient::CatalogModifierOverride.from_json(json_object: item)
end
      min_selected_modifiers = parsed_json["min_selected_modifiers"]
      max_selected_modifiers = parsed_json["max_selected_modifiers"]
      enabled = parsed_json["enabled"]
      ordinal = parsed_json["ordinal"]
      allow_quantities = parsed_json["allow_quantities"]
      is_conversational = parsed_json["is_conversational"]
      hidden_from_customer_override = parsed_json["hidden_from_customer_override"]
      new(
        modifier_list_id: modifier_list_id,
        modifier_overrides: modifier_overrides,
        min_selected_modifiers: min_selected_modifiers,
        max_selected_modifiers: max_selected_modifiers,
        enabled: enabled,
        ordinal: ordinal,
        allow_quantities: allow_quantities,
        is_conversational: is_conversational,
        hidden_from_customer_override: hidden_from_customer_override,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItemModifierListInfo to a JSON object
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
      obj.modifier_list_id.is_a?(String) != false || raise("Passed value for field obj.modifier_list_id is not the expected type, validation failed.")
      obj.modifier_overrides&.is_a?(Array) != false || raise("Passed value for field obj.modifier_overrides is not the expected type, validation failed.")
      obj.min_selected_modifiers&.is_a?(Integer) != false || raise("Passed value for field obj.min_selected_modifiers is not the expected type, validation failed.")
      obj.max_selected_modifiers&.is_a?(Integer) != false || raise("Passed value for field obj.max_selected_modifiers is not the expected type, validation failed.")
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.ordinal&.is_a?(Integer) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
      obj.allow_quantities&.is_a?(Object) != false || raise("Passed value for field obj.allow_quantities is not the expected type, validation failed.")
      obj.is_conversational&.is_a?(Object) != false || raise("Passed value for field obj.is_conversational is not the expected type, validation failed.")
      obj.hidden_from_customer_override&.is_a?(Object) != false || raise("Passed value for field obj.hidden_from_customer_override is not the expected type, validation failed.")
    end
  end
end