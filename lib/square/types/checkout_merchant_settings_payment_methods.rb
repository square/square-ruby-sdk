# frozen_string_literal: true
require_relative "checkout_merchant_settings_payment_methods_payment_method"
require_relative "checkout_merchant_settings_payment_methods_afterpay_clearpay"
require "ostruct"
require "json"

module square.rb
  class CheckoutMerchantSettingsPaymentMethods
  # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod] 
    attr_reader :apple_pay
  # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod] 
    attr_reader :google_pay
  # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod] 
    attr_reader :cash_app
  # @return [square.rb::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay] 
    attr_reader :afterpay_clearpay
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param apple_pay [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod] 
    # @param google_pay [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod] 
    # @param cash_app [square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod] 
    # @param afterpay_clearpay [square.rb::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutMerchantSettingsPaymentMethods]
    def initialize(apple_pay: OMIT, google_pay: OMIT, cash_app: OMIT, afterpay_clearpay: OMIT, additional_properties: nil)
      @apple_pay = apple_pay if apple_pay != OMIT
      @google_pay = google_pay if google_pay != OMIT
      @cash_app = cash_app if cash_app != OMIT
      @afterpay_clearpay = afterpay_clearpay if afterpay_clearpay != OMIT
      @additional_properties = additional_properties
      @_field_set = { "apple_pay": apple_pay, "google_pay": google_pay, "cash_app": cash_app, "afterpay_clearpay": afterpay_clearpay }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CheckoutMerchantSettingsPaymentMethods
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutMerchantSettingsPaymentMethods]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["apple_pay"].nil?
        apple_pay = parsed_json["apple_pay"].to_json
        apple_pay = square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod.from_json(json_object: apple_pay)
      else
        apple_pay = nil
      end
      unless parsed_json["google_pay"].nil?
        google_pay = parsed_json["google_pay"].to_json
        google_pay = square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod.from_json(json_object: google_pay)
      else
        google_pay = nil
      end
      unless parsed_json["cash_app"].nil?
        cash_app = parsed_json["cash_app"].to_json
        cash_app = square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod.from_json(json_object: cash_app)
      else
        cash_app = nil
      end
      unless parsed_json["afterpay_clearpay"].nil?
        afterpay_clearpay = parsed_json["afterpay_clearpay"].to_json
        afterpay_clearpay = square.rb::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay.from_json(json_object: afterpay_clearpay)
      else
        afterpay_clearpay = nil
      end
      new(
        apple_pay: apple_pay,
        google_pay: google_pay,
        cash_app: cash_app,
        afterpay_clearpay: afterpay_clearpay,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutMerchantSettingsPaymentMethods to a JSON object
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
      obj.apple_pay.nil? || square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod.validate_raw(obj: obj.apple_pay)
      obj.google_pay.nil? || square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod.validate_raw(obj: obj.google_pay)
      obj.cash_app.nil? || square.rb::CheckoutMerchantSettingsPaymentMethodsPaymentMethod.validate_raw(obj: obj.cash_app)
      obj.afterpay_clearpay.nil? || square.rb::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay.validate_raw(obj: obj.afterpay_clearpay)
    end
  end
end