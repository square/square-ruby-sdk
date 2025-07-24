# frozen_string_literal: true
require_relative "tax_calculation_phase"
require_relative "tax_inclusion_type"
require "ostruct"
require "json"

module SquareApiClient
# A tax applicable to an item.
  class CatalogTax
  # @return [String] The tax's name. This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    attr_reader :name
  # @return [SquareApiClient::TaxCalculationPhase] Whether the tax is calculated based on a payment's subtotal or total.
#  See [TaxCalculationPhase](#type-taxcalculationphase) for possible values
    attr_reader :calculation_phase
  # @return [SquareApiClient::TaxInclusionType] Whether the tax is `ADDITIVE` or `INCLUSIVE`.
#  See [TaxInclusionType](#type-taxinclusiontype) for possible values
    attr_reader :inclusion_type
  # @return [String] The percentage of the tax in decimal form, using a `'.'` as the decimal
#  separator and without a `'%'` sign.
#  A value of `7.5` corresponds to 7.5%. For a location-specific tax rate, contact
#  the tax authority of the location or a tax consultant.
    attr_reader :percentage
  # @return [Boolean] If `true`, the fee applies to custom amounts entered into the Square Point of
#  Sale
#  app that are not associated with a particular `CatalogItem`.
    attr_reader :applies_to_custom_amounts
  # @return [Boolean] A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in
#  the Square Point of Sale app or not (`false`).
    attr_reader :enabled
  # @return [String] The ID of a `CatalogProductSet` object. If set, the tax is applicable to all
#  products in the product set.
    attr_reader :applies_to_product_set_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The tax's name. This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    # @param calculation_phase [SquareApiClient::TaxCalculationPhase] Whether the tax is calculated based on a payment's subtotal or total.
#  See [TaxCalculationPhase](#type-taxcalculationphase) for possible values
    # @param inclusion_type [SquareApiClient::TaxInclusionType] Whether the tax is `ADDITIVE` or `INCLUSIVE`.
#  See [TaxInclusionType](#type-taxinclusiontype) for possible values
    # @param percentage [String] The percentage of the tax in decimal form, using a `'.'` as the decimal
#  separator and without a `'%'` sign.
#  A value of `7.5` corresponds to 7.5%. For a location-specific tax rate, contact
#  the tax authority of the location or a tax consultant.
    # @param applies_to_custom_amounts [Boolean] If `true`, the fee applies to custom amounts entered into the Square Point of
#  Sale
#  app that are not associated with a particular `CatalogItem`.
    # @param enabled [Boolean] A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in
#  the Square Point of Sale app or not (`false`).
    # @param applies_to_product_set_id [String] The ID of a `CatalogProductSet` object. If set, the tax is applicable to all
#  products in the product set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogTax]
    def initialize(name: OMIT, calculation_phase: OMIT, inclusion_type: OMIT, percentage: OMIT, applies_to_custom_amounts: OMIT, enabled: OMIT, applies_to_product_set_id: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @calculation_phase = calculation_phase if calculation_phase != OMIT
      @inclusion_type = inclusion_type if inclusion_type != OMIT
      @percentage = percentage if percentage != OMIT
      @applies_to_custom_amounts = applies_to_custom_amounts if applies_to_custom_amounts != OMIT
      @enabled = enabled if enabled != OMIT
      @applies_to_product_set_id = applies_to_product_set_id if applies_to_product_set_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "calculation_phase": calculation_phase, "inclusion_type": inclusion_type, "percentage": percentage, "applies_to_custom_amounts": applies_to_custom_amounts, "enabled": enabled, "applies_to_product_set_id": applies_to_product_set_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogTax
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogTax]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      calculation_phase = parsed_json["calculation_phase"]
      inclusion_type = parsed_json["inclusion_type"]
      percentage = parsed_json["percentage"]
      applies_to_custom_amounts = parsed_json["applies_to_custom_amounts"]
      enabled = parsed_json["enabled"]
      applies_to_product_set_id = parsed_json["applies_to_product_set_id"]
      new(
        name: name,
        calculation_phase: calculation_phase,
        inclusion_type: inclusion_type,
        percentage: percentage,
        applies_to_custom_amounts: applies_to_custom_amounts,
        enabled: enabled,
        applies_to_product_set_id: applies_to_product_set_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogTax to a JSON object
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
      obj.calculation_phase&.is_a?(SquareApiClient::TaxCalculationPhase) != false || raise("Passed value for field obj.calculation_phase is not the expected type, validation failed.")
      obj.inclusion_type&.is_a?(SquareApiClient::TaxInclusionType) != false || raise("Passed value for field obj.inclusion_type is not the expected type, validation failed.")
      obj.percentage&.is_a?(String) != false || raise("Passed value for field obj.percentage is not the expected type, validation failed.")
      obj.applies_to_custom_amounts&.is_a?(Boolean) != false || raise("Passed value for field obj.applies_to_custom_amounts is not the expected type, validation failed.")
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.applies_to_product_set_id&.is_a?(String) != false || raise("Passed value for field obj.applies_to_product_set_id is not the expected type, validation failed.")
    end
  end
end