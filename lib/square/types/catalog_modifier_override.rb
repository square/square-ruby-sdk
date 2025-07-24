# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Options to control how to override the default behavior of the specified
#  modifier.
  class CatalogModifierOverride
  # @return [String] The ID of the `CatalogModifier` whose default behavior is being overridden.
    attr_reader :modifier_id
  # @return [Boolean] __Deprecated__: Use `on_by_default_override` instead.
    attr_reader :on_by_default
  # @return [Object] 
    attr_reader :hidden_online_override
  # @return [Object] 
    attr_reader :on_by_default_override
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param modifier_id [String] The ID of the `CatalogModifier` whose default behavior is being overridden.
    # @param on_by_default [Boolean] __Deprecated__: Use `on_by_default_override` instead.
    # @param hidden_online_override [Object] 
    # @param on_by_default_override [Object] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogModifierOverride]
    def initialize(modifier_id:, on_by_default: OMIT, hidden_online_override: OMIT, on_by_default_override: OMIT, additional_properties: nil)
      @modifier_id = modifier_id
      @on_by_default = on_by_default if on_by_default != OMIT
      @hidden_online_override = hidden_online_override if hidden_online_override != OMIT
      @on_by_default_override = on_by_default_override if on_by_default_override != OMIT
      @additional_properties = additional_properties
      @_field_set = { "modifier_id": modifier_id, "on_by_default": on_by_default, "hidden_online_override": hidden_online_override, "on_by_default_override": on_by_default_override }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogModifierOverride
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogModifierOverride]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      modifier_id = parsed_json["modifier_id"]
      on_by_default = parsed_json["on_by_default"]
      hidden_online_override = parsed_json["hidden_online_override"]
      on_by_default_override = parsed_json["on_by_default_override"]
      new(
        modifier_id: modifier_id,
        on_by_default: on_by_default,
        hidden_online_override: hidden_online_override,
        on_by_default_override: on_by_default_override,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogModifierOverride to a JSON object
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
      obj.modifier_id.is_a?(String) != false || raise("Passed value for field obj.modifier_id is not the expected type, validation failed.")
      obj.on_by_default&.is_a?(Boolean) != false || raise("Passed value for field obj.on_by_default is not the expected type, validation failed.")
      obj.hidden_online_override&.is_a?(Object) != false || raise("Passed value for field obj.hidden_online_override is not the expected type, validation failed.")
      obj.on_by_default_override&.is_a?(Object) != false || raise("Passed value for field obj.on_by_default_override is not the expected type, validation failed.")
    end
  end
end