# frozen_string_literal: true
require_relative "catalog_modifier_list_selection_type"
require_relative "catalog_object"
require_relative "catalog_modifier_list_modifier_type"
require "ostruct"
require "json"

module square.rb
# A container for a list of modifiers, or a text-based modifier.
#  For text-based modifiers, this represents text configuration for an item. (For
#  example, custom text to print on a t-shirt).
#  For non text-based modifiers, this represents a list of modifiers that can be
#  applied to items at the time of sale.
#  (For example, a list of condiments for a hot dog, or a list of ice cream
#  flavors).
#  Each element of the modifier list is a `CatalogObject` instance of the
#  `MODIFIER` type.
  class CatalogModifierList
  # @return [String] The name of the `CatalogModifierList` instance. This is a searchable attribute
#  for use in applicable query filters, and its value length is of
#  Unicode code points.
    attr_reader :name
  # @return [Integer] The position of this `CatalogModifierList` within a list of
#  `CatalogModifierList` instances.
    attr_reader :ordinal
  # @return [square.rb::CatalogModifierListSelectionType] __Deprecated__: Indicates whether a single (`SINGLE`) modifier or multiple
#  (`MULTIPLE`) modifiers can be selected. Use
#  `min_selected_modifiers` and `max_selected_modifiers` instead.
#  See [CatalogModifierListSelectionType](#type-catalogmodifierlistselectiontype)
#  for possible values
    attr_reader :selection_type
  # @return [Array<square.rb::CatalogObject>] A non-empty list of `CatalogModifier` objects to be included in the
#  `CatalogModifierList`,
#  for non text-based modifiers when the `modifier_type` attribute is `LIST`. Each
#  element of this list
#  is a `CatalogObject` instance of the `MODIFIER` type, containing the following
#  attributes:
#  ```
#  {
#  "id": "{{catalog_modifier_id}}",
#  "type": "MODIFIER",
#  "modifier_data": {{a CatalogModifier instance>}}
#  }
#  ```
    attr_reader :modifiers
  # @return [Array<String>] The IDs of images associated with this `CatalogModifierList` instance.
#  Currently these images are not displayed on Square products, but may be
#  displayed in 3rd-party applications.
    attr_reader :image_ids
  # @return [Boolean] When `true`, allows multiple quantities of the same modifier to be selected.
    attr_reader :allow_quantities
  # @return [Boolean] True if modifiers belonging to this list can be used conversationally.
    attr_reader :is_conversational
  # @return [square.rb::CatalogModifierListModifierType] The type of the modifier.
#  When this `modifier_type` value is `TEXT`,  the `CatalogModifierList` represents
#  a text-based modifier.
#  When this `modifier_type` value is `LIST`, the `CatalogModifierList` contains a
#  list of `CatalogModifier` objects.
#  See [CatalogModifierListModifierType](#type-catalogmodifierlistmodifiertype) for
#  possible values
    attr_reader :modifier_type
  # @return [Integer] The maximum length, in Unicode points, of the text string of the text-based
#  modifier as represented by
#  this `CatalogModifierList` object with the `modifier_type` set to `TEXT`.
    attr_reader :max_length
  # @return [Boolean] Whether the text string must be a non-empty string (`true`) or not (`false`) for
#  a text-based modifier
#  as represented by this `CatalogModifierList` object with the `modifier_type` set
#  to `TEXT`.
    attr_reader :text_required
  # @return [String] A note for internal use by the business.
#  For example, for a text-based modifier applied to a T-shirt item, if the
#  buyer-supplied text of "Hello, Kitty!"
#  is to be printed on the T-shirt, this `internal_name` attribute can be "Use
#  italic face" as
#  an instruction for the business to follow.
#  For non text-based modifiers, this `internal_name` attribute can be
#  used to include SKUs, internal codes, or supplemental descriptions for internal
#  use.
    attr_reader :internal_name
  # @return [Long] The minimum number of modifiers that must be selected from this list. The value
#  can be overridden with `CatalogItemModifierListInfo`.
#  Values:
#  - 0: No selection is required.
#  - -1: Default value, the attribute was not set by the client. Treated as no
#  selection required.
#  - &gt;0: The required minimum modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no selection required.
    attr_reader :min_selected_modifiers
  # @return [Long] The maximum number of modifiers that must be selected from this list. The value
#  can be overridden with `CatalogItemModifierListInfo`.
#  Values:
#  - 0: No maximum limit.
#  - -1: Default value, the attribute was not set by the client. Treated as no
#  maximum limit.
#  - &gt;0: The maximum total modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no maximum limit.
    attr_reader :max_selected_modifiers
  # @return [Boolean] If `true`, modifiers from this list are hidden from customer receipts. The
#  default value is `false`.
#  This setting can be overridden with
#  `CatalogItemModifierListInfo.hidden_from_customer_override`.
    attr_reader :hidden_from_customer
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the `CatalogModifierList` instance. This is a searchable attribute
#  for use in applicable query filters, and its value length is of
#  Unicode code points.
    # @param ordinal [Integer] The position of this `CatalogModifierList` within a list of
#  `CatalogModifierList` instances.
    # @param selection_type [square.rb::CatalogModifierListSelectionType] __Deprecated__: Indicates whether a single (`SINGLE`) modifier or multiple
#  (`MULTIPLE`) modifiers can be selected. Use
#  `min_selected_modifiers` and `max_selected_modifiers` instead.
#  See [CatalogModifierListSelectionType](#type-catalogmodifierlistselectiontype)
#  for possible values
    # @param modifiers [Array<square.rb::CatalogObject>] A non-empty list of `CatalogModifier` objects to be included in the
#  `CatalogModifierList`,
#  for non text-based modifiers when the `modifier_type` attribute is `LIST`. Each
#  element of this list
#  is a `CatalogObject` instance of the `MODIFIER` type, containing the following
#  attributes:
#  ```
#  {
#  "id": "{{catalog_modifier_id}}",
#  "type": "MODIFIER",
#  "modifier_data": {{a CatalogModifier instance>}}
#  }
#  ```
    # @param image_ids [Array<String>] The IDs of images associated with this `CatalogModifierList` instance.
#  Currently these images are not displayed on Square products, but may be
#  displayed in 3rd-party applications.
    # @param allow_quantities [Boolean] When `true`, allows multiple quantities of the same modifier to be selected.
    # @param is_conversational [Boolean] True if modifiers belonging to this list can be used conversationally.
    # @param modifier_type [square.rb::CatalogModifierListModifierType] The type of the modifier.
#  When this `modifier_type` value is `TEXT`,  the `CatalogModifierList` represents
#  a text-based modifier.
#  When this `modifier_type` value is `LIST`, the `CatalogModifierList` contains a
#  list of `CatalogModifier` objects.
#  See [CatalogModifierListModifierType](#type-catalogmodifierlistmodifiertype) for
#  possible values
    # @param max_length [Integer] The maximum length, in Unicode points, of the text string of the text-based
#  modifier as represented by
#  this `CatalogModifierList` object with the `modifier_type` set to `TEXT`.
    # @param text_required [Boolean] Whether the text string must be a non-empty string (`true`) or not (`false`) for
#  a text-based modifier
#  as represented by this `CatalogModifierList` object with the `modifier_type` set
#  to `TEXT`.
    # @param internal_name [String] A note for internal use by the business.
#  For example, for a text-based modifier applied to a T-shirt item, if the
#  buyer-supplied text of "Hello, Kitty!"
#  is to be printed on the T-shirt, this `internal_name` attribute can be "Use
#  italic face" as
#  an instruction for the business to follow.
#  For non text-based modifiers, this `internal_name` attribute can be
#  used to include SKUs, internal codes, or supplemental descriptions for internal
#  use.
    # @param min_selected_modifiers [Long] The minimum number of modifiers that must be selected from this list. The value
#  can be overridden with `CatalogItemModifierListInfo`.
#  Values:
#  - 0: No selection is required.
#  - -1: Default value, the attribute was not set by the client. Treated as no
#  selection required.
#  - &gt;0: The required minimum modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no selection required.
    # @param max_selected_modifiers [Long] The maximum number of modifiers that must be selected from this list. The value
#  can be overridden with `CatalogItemModifierListInfo`.
#  Values:
#  - 0: No maximum limit.
#  - -1: Default value, the attribute was not set by the client. Treated as no
#  maximum limit.
#  - &gt;0: The maximum total modifier selections. This can be larger than the
#  total `CatalogModifiers` when `allow_quantities` is enabled.
#  - &lt; -1: Invalid. Treated as no maximum limit.
    # @param hidden_from_customer [Boolean] If `true`, modifiers from this list are hidden from customer receipts. The
#  default value is `false`.
#  This setting can be overridden with
#  `CatalogItemModifierListInfo.hidden_from_customer_override`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogModifierList]
    def initialize(name: OMIT, ordinal: OMIT, selection_type: OMIT, modifiers: OMIT, image_ids: OMIT, allow_quantities: OMIT, is_conversational: OMIT, modifier_type: OMIT, max_length: OMIT, text_required: OMIT, internal_name: OMIT, min_selected_modifiers: OMIT, max_selected_modifiers: OMIT, hidden_from_customer: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @selection_type = selection_type if selection_type != OMIT
      @modifiers = modifiers if modifiers != OMIT
      @image_ids = image_ids if image_ids != OMIT
      @allow_quantities = allow_quantities if allow_quantities != OMIT
      @is_conversational = is_conversational if is_conversational != OMIT
      @modifier_type = modifier_type if modifier_type != OMIT
      @max_length = max_length if max_length != OMIT
      @text_required = text_required if text_required != OMIT
      @internal_name = internal_name if internal_name != OMIT
      @min_selected_modifiers = min_selected_modifiers if min_selected_modifiers != OMIT
      @max_selected_modifiers = max_selected_modifiers if max_selected_modifiers != OMIT
      @hidden_from_customer = hidden_from_customer if hidden_from_customer != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "ordinal": ordinal, "selection_type": selection_type, "modifiers": modifiers, "image_ids": image_ids, "allow_quantities": allow_quantities, "is_conversational": is_conversational, "modifier_type": modifier_type, "max_length": max_length, "text_required": text_required, "internal_name": internal_name, "min_selected_modifiers": min_selected_modifiers, "max_selected_modifiers": max_selected_modifiers, "hidden_from_customer": hidden_from_customer }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogModifierList
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogModifierList]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      ordinal = parsed_json["ordinal"]
      selection_type = parsed_json["selection_type"]
      modifiers = parsed_json["modifiers"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      image_ids = parsed_json["image_ids"]
      allow_quantities = parsed_json["allow_quantities"]
      is_conversational = parsed_json["is_conversational"]
      modifier_type = parsed_json["modifier_type"]
      max_length = parsed_json["max_length"]
      text_required = parsed_json["text_required"]
      internal_name = parsed_json["internal_name"]
      min_selected_modifiers = parsed_json["min_selected_modifiers"]
      max_selected_modifiers = parsed_json["max_selected_modifiers"]
      hidden_from_customer = parsed_json["hidden_from_customer"]
      new(
        name: name,
        ordinal: ordinal,
        selection_type: selection_type,
        modifiers: modifiers,
        image_ids: image_ids,
        allow_quantities: allow_quantities,
        is_conversational: is_conversational,
        modifier_type: modifier_type,
        max_length: max_length,
        text_required: text_required,
        internal_name: internal_name,
        min_selected_modifiers: min_selected_modifiers,
        max_selected_modifiers: max_selected_modifiers,
        hidden_from_customer: hidden_from_customer,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogModifierList to a JSON object
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
      obj.ordinal&.is_a?(Integer) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
      obj.selection_type&.is_a?(square.rb::CatalogModifierListSelectionType) != false || raise("Passed value for field obj.selection_type is not the expected type, validation failed.")
      obj.modifiers&.is_a?(Array) != false || raise("Passed value for field obj.modifiers is not the expected type, validation failed.")
      obj.image_ids&.is_a?(Array) != false || raise("Passed value for field obj.image_ids is not the expected type, validation failed.")
      obj.allow_quantities&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_quantities is not the expected type, validation failed.")
      obj.is_conversational&.is_a?(Boolean) != false || raise("Passed value for field obj.is_conversational is not the expected type, validation failed.")
      obj.modifier_type&.is_a?(square.rb::CatalogModifierListModifierType) != false || raise("Passed value for field obj.modifier_type is not the expected type, validation failed.")
      obj.max_length&.is_a?(Integer) != false || raise("Passed value for field obj.max_length is not the expected type, validation failed.")
      obj.text_required&.is_a?(Boolean) != false || raise("Passed value for field obj.text_required is not the expected type, validation failed.")
      obj.internal_name&.is_a?(String) != false || raise("Passed value for field obj.internal_name is not the expected type, validation failed.")
      obj.min_selected_modifiers&.is_a?(Long) != false || raise("Passed value for field obj.min_selected_modifiers is not the expected type, validation failed.")
      obj.max_selected_modifiers&.is_a?(Long) != false || raise("Passed value for field obj.max_selected_modifiers is not the expected type, validation failed.")
      obj.hidden_from_customer&.is_a?(Boolean) != false || raise("Passed value for field obj.hidden_from_customer is not the expected type, validation failed.")
    end
  end
end