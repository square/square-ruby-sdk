# frozen_string_literal: true
require_relative "catalog_quick_amounts_settings_option"
require_relative "catalog_quick_amount"
require "ostruct"
require "json"

module SquareApiClient
# A parent Catalog Object model represents a set of Quick Amounts and the settings
#  control the amounts.
  class CatalogQuickAmountsSettings
  # @return [SquareApiClient::CatalogQuickAmountsSettingsOption] Represents the option seller currently uses on Quick Amounts.
#  See [CatalogQuickAmountsSettingsOption](#type-catalogquickamountssettingsoption)
#  for possible values
    attr_reader :option
  # @return [Boolean] Represents location's eligibility for auto amounts
#  The boolean should be consistent with whether there are AUTO amounts in the
#  `amounts`.
    attr_reader :eligible_for_auto_amounts
  # @return [Array<SquareApiClient::CatalogQuickAmount>] Represents a set of Quick Amounts at this location.
    attr_reader :amounts
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param option [SquareApiClient::CatalogQuickAmountsSettingsOption] Represents the option seller currently uses on Quick Amounts.
#  See [CatalogQuickAmountsSettingsOption](#type-catalogquickamountssettingsoption)
#  for possible values
    # @param eligible_for_auto_amounts [Boolean] Represents location's eligibility for auto amounts
#  The boolean should be consistent with whether there are AUTO amounts in the
#  `amounts`.
    # @param amounts [Array<SquareApiClient::CatalogQuickAmount>] Represents a set of Quick Amounts at this location.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQuickAmountsSettings]
    def initialize(option:, eligible_for_auto_amounts: OMIT, amounts: OMIT, additional_properties: nil)
      @option = option
      @eligible_for_auto_amounts = eligible_for_auto_amounts if eligible_for_auto_amounts != OMIT
      @amounts = amounts if amounts != OMIT
      @additional_properties = additional_properties
      @_field_set = { "option": option, "eligible_for_auto_amounts": eligible_for_auto_amounts, "amounts": amounts }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogQuickAmountsSettings
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQuickAmountsSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      option = parsed_json["option"]
      eligible_for_auto_amounts = parsed_json["eligible_for_auto_amounts"]
      amounts = parsed_json["amounts"]&.map do | item |
  item = item.to_json
  SquareApiClient::CatalogQuickAmount.from_json(json_object: item)
end
      new(
        option: option,
        eligible_for_auto_amounts: eligible_for_auto_amounts,
        amounts: amounts,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQuickAmountsSettings to a JSON object
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
      obj.option.is_a?(SquareApiClient::CatalogQuickAmountsSettingsOption) != false || raise("Passed value for field obj.option is not the expected type, validation failed.")
      obj.eligible_for_auto_amounts&.is_a?(Boolean) != false || raise("Passed value for field obj.eligible_for_auto_amounts is not the expected type, validation failed.")
      obj.amounts&.is_a?(Array) != false || raise("Passed value for field obj.amounts is not the expected type, validation failed.")
    end
  end
end