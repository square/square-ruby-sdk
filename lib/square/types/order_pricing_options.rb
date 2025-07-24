# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Pricing options for an order. The options affect how the order's price is
#  calculated.
#  They can be used, for example, to apply automatic price adjustments that are
#  based on preconfigured
#  [pricing rules](entity:CatalogPricingRule).
  class OrderPricingOptions
  # @return [Boolean] The option to determine whether pricing rule-based
#  discounts are automatically applied to an order.
    attr_reader :auto_apply_discounts
  # @return [Boolean] The option to determine whether rule-based taxes are automatically
#  applied to an order when the criteria of the corresponding rules are met.
    attr_reader :auto_apply_taxes
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param auto_apply_discounts [Boolean] The option to determine whether pricing rule-based
#  discounts are automatically applied to an order.
    # @param auto_apply_taxes [Boolean] The option to determine whether rule-based taxes are automatically
#  applied to an order when the criteria of the corresponding rules are met.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderPricingOptions]
    def initialize(auto_apply_discounts: OMIT, auto_apply_taxes: OMIT, additional_properties: nil)
      @auto_apply_discounts = auto_apply_discounts if auto_apply_discounts != OMIT
      @auto_apply_taxes = auto_apply_taxes if auto_apply_taxes != OMIT
      @additional_properties = additional_properties
      @_field_set = { "auto_apply_discounts": auto_apply_discounts, "auto_apply_taxes": auto_apply_taxes }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderPricingOptions
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderPricingOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      auto_apply_discounts = parsed_json["auto_apply_discounts"]
      auto_apply_taxes = parsed_json["auto_apply_taxes"]
      new(
        auto_apply_discounts: auto_apply_discounts,
        auto_apply_taxes: auto_apply_taxes,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderPricingOptions to a JSON object
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
      obj.auto_apply_discounts&.is_a?(Boolean) != false || raise("Passed value for field obj.auto_apply_discounts is not the expected type, validation failed.")
      obj.auto_apply_taxes&.is_a?(Boolean) != false || raise("Passed value for field obj.auto_apply_taxes is not the expected type, validation failed.")
    end
  end
end