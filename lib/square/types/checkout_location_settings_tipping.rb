# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
  class CheckoutLocationSettingsTipping
  # @return [Array<Integer>] Set three custom percentage amounts that buyers can select at checkout. If Smart
#  Tip is enabled, this only applies to transactions totaling $10 or more.
    attr_reader :percentages
  # @return [Boolean] Enables Smart Tip Amounts. If Smart Tip Amounts is enabled, tipping works as
#  follows:
#  If a transaction is less than $10, the available tipping options include No Tip,
#  $1, $2, or $3.
#  If a transaction is $10 or more, the available tipping options include No Tip,
#  15%, 20%, or 25%.
#  You can set custom percentage amounts with the `percentages` field.
    attr_reader :smart_tipping_enabled
  # @return [Integer] Set the pre-selected percentage amounts that appear at checkout. If Smart Tip is
#  enabled, this only applies to transactions totaling $10 or more.
    attr_reader :default_percent
  # @return [Array<square.rb::Money>] Show the Smart Tip Amounts for this location.
    attr_reader :smart_tips
  # @return [square.rb::Money] Set the pre-selected whole amount that appears at checkout when Smart Tip is
#  enabled and the transaction amount is less than $10.
    attr_reader :default_smart_tip
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param percentages [Array<Integer>] Set three custom percentage amounts that buyers can select at checkout. If Smart
#  Tip is enabled, this only applies to transactions totaling $10 or more.
    # @param smart_tipping_enabled [Boolean] Enables Smart Tip Amounts. If Smart Tip Amounts is enabled, tipping works as
#  follows:
#  If a transaction is less than $10, the available tipping options include No Tip,
#  $1, $2, or $3.
#  If a transaction is $10 or more, the available tipping options include No Tip,
#  15%, 20%, or 25%.
#  You can set custom percentage amounts with the `percentages` field.
    # @param default_percent [Integer] Set the pre-selected percentage amounts that appear at checkout. If Smart Tip is
#  enabled, this only applies to transactions totaling $10 or more.
    # @param smart_tips [Array<square.rb::Money>] Show the Smart Tip Amounts for this location.
    # @param default_smart_tip [square.rb::Money] Set the pre-selected whole amount that appears at checkout when Smart Tip is
#  enabled and the transaction amount is less than $10.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutLocationSettingsTipping]
    def initialize(percentages: OMIT, smart_tipping_enabled: OMIT, default_percent: OMIT, smart_tips: OMIT, default_smart_tip: OMIT, additional_properties: nil)
      @percentages = percentages if percentages != OMIT
      @smart_tipping_enabled = smart_tipping_enabled if smart_tipping_enabled != OMIT
      @default_percent = default_percent if default_percent != OMIT
      @smart_tips = smart_tips if smart_tips != OMIT
      @default_smart_tip = default_smart_tip if default_smart_tip != OMIT
      @additional_properties = additional_properties
      @_field_set = { "percentages": percentages, "smart_tipping_enabled": smart_tipping_enabled, "default_percent": default_percent, "smart_tips": smart_tips, "default_smart_tip": default_smart_tip }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CheckoutLocationSettingsTipping
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutLocationSettingsTipping]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      percentages = parsed_json["percentages"]
      smart_tipping_enabled = parsed_json["smart_tipping_enabled"]
      default_percent = parsed_json["default_percent"]
      smart_tips = parsed_json["smart_tips"]&.map do | item |
  item = item.to_json
  square.rb::Money.from_json(json_object: item)
end
      unless parsed_json["default_smart_tip"].nil?
        default_smart_tip = parsed_json["default_smart_tip"].to_json
        default_smart_tip = square.rb::Money.from_json(json_object: default_smart_tip)
      else
        default_smart_tip = nil
      end
      new(
        percentages: percentages,
        smart_tipping_enabled: smart_tipping_enabled,
        default_percent: default_percent,
        smart_tips: smart_tips,
        default_smart_tip: default_smart_tip,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutLocationSettingsTipping to a JSON object
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
      obj.percentages&.is_a?(Array) != false || raise("Passed value for field obj.percentages is not the expected type, validation failed.")
      obj.smart_tipping_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.smart_tipping_enabled is not the expected type, validation failed.")
      obj.default_percent&.is_a?(Integer) != false || raise("Passed value for field obj.default_percent is not the expected type, validation failed.")
      obj.smart_tips&.is_a?(Array) != false || raise("Passed value for field obj.smart_tips is not the expected type, validation failed.")
      obj.default_smart_tip.nil? || square.rb::Money.validate_raw(obj: obj.default_smart_tip)
    end
  end
end