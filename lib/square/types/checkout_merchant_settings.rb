# frozen_string_literal: true
require_relative "checkout_merchant_settings_payment_methods"
require "ostruct"
require "json"

module square.rb
  class CheckoutMerchantSettings
  # @return [square.rb::CheckoutMerchantSettingsPaymentMethods] The set of payment methods accepted for the merchant's account.
    attr_reader :payment_methods
  # @return [String] The timestamp when the settings were last updated, in RFC 3339 format.
#  Examples for January 25th, 2020 6:25:34pm Pacific Standard Time:
#  UTC: 2020-01-26T02:25:34Z
#  Pacific Standard Time with UTC offset: 2020-01-25T18:25:34-08:00
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment_methods [square.rb::CheckoutMerchantSettingsPaymentMethods] The set of payment methods accepted for the merchant's account.
    # @param updated_at [String] The timestamp when the settings were last updated, in RFC 3339 format.
#  Examples for January 25th, 2020 6:25:34pm Pacific Standard Time:
#  UTC: 2020-01-26T02:25:34Z
#  Pacific Standard Time with UTC offset: 2020-01-25T18:25:34-08:00
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutMerchantSettings]
    def initialize(payment_methods: OMIT, updated_at: OMIT, additional_properties: nil)
      @payment_methods = payment_methods if payment_methods != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment_methods": payment_methods, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CheckoutMerchantSettings
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutMerchantSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["payment_methods"].nil?
        payment_methods = parsed_json["payment_methods"].to_json
        payment_methods = square.rb::CheckoutMerchantSettingsPaymentMethods.from_json(json_object: payment_methods)
      else
        payment_methods = nil
      end
      updated_at = parsed_json["updated_at"]
      new(
        payment_methods: payment_methods,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutMerchantSettings to a JSON object
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
      obj.payment_methods.nil? || square.rb::CheckoutMerchantSettingsPaymentMethods.validate_raw(obj: obj.payment_methods)
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end