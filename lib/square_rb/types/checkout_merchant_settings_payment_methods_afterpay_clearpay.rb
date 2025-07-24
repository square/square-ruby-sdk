# frozen_string_literal: true
require_relative "checkout_merchant_settings_payment_methods_afterpay_clearpay_eligibility_range"
require "ostruct"
require "json"

module SquareApiClient
# The settings allowed for AfterpayClearpay.
  class CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay
  # @return [SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange] Afterpay is shown as an option for order totals falling within the configured
#  range.
    attr_reader :order_eligibility_range
  # @return [SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange] Afterpay is shown as an option for item totals falling within the configured
#  range.
    attr_reader :item_eligibility_range
  # @return [Boolean] Indicates whether the payment method is enabled for the account.
    attr_reader :enabled
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_eligibility_range [SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange] Afterpay is shown as an option for order totals falling within the configured
#  range.
    # @param item_eligibility_range [SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange] Afterpay is shown as an option for item totals falling within the configured
#  range.
    # @param enabled [Boolean] Indicates whether the payment method is enabled for the account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay]
    def initialize(order_eligibility_range: OMIT, item_eligibility_range: OMIT, enabled: OMIT, additional_properties: nil)
      @order_eligibility_range = order_eligibility_range if order_eligibility_range != OMIT
      @item_eligibility_range = item_eligibility_range if item_eligibility_range != OMIT
      @enabled = enabled if enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order_eligibility_range": order_eligibility_range, "item_eligibility_range": item_eligibility_range, "enabled": enabled }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["order_eligibility_range"].nil?
        order_eligibility_range = parsed_json["order_eligibility_range"].to_json
        order_eligibility_range = SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange.from_json(json_object: order_eligibility_range)
      else
        order_eligibility_range = nil
      end
      unless parsed_json["item_eligibility_range"].nil?
        item_eligibility_range = parsed_json["item_eligibility_range"].to_json
        item_eligibility_range = SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange.from_json(json_object: item_eligibility_range)
      else
        item_eligibility_range = nil
      end
      enabled = parsed_json["enabled"]
      new(
        order_eligibility_range: order_eligibility_range,
        item_eligibility_range: item_eligibility_range,
        enabled: enabled,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay
#  to a JSON object
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
      obj.order_eligibility_range.nil? || SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange.validate_raw(obj: obj.order_eligibility_range)
      obj.item_eligibility_range.nil? || SquareApiClient::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange.validate_raw(obj: obj.item_eligibility_range)
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
    end
  end
end