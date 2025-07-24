# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# The settings allowed for a payment method.
  class CheckoutMerchantSettingsPaymentMethodsPaymentMethod
  # @return [Boolean] Indicates whether the payment method is enabled for the account.
    attr_reader :enabled
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] Indicates whether the payment method is enabled for the account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod]
    def initialize(enabled: OMIT, additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "enabled": enabled }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CheckoutMerchantSettingsPaymentMethodsPaymentMethod
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      new(enabled: enabled, additional_properties: struct)
    end
# Serialize an instance of CheckoutMerchantSettingsPaymentMethodsPaymentMethod to
#  a JSON object
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
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
    end
  end
end