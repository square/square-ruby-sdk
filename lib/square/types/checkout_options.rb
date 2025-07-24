# frozen_string_literal: true
require_relative "custom_field"
require_relative "accepted_payment_methods"
require_relative "money"
require_relative "shipping_fee"
require "ostruct"
require "json"

module square.rb
  class CheckoutOptions
  # @return [Boolean] Indicates whether the payment allows tipping.
    attr_reader :allow_tipping
  # @return [Array<square.rb::CustomField>] The custom fields requesting information from the buyer.
    attr_reader :custom_fields
  # @return [String] The ID of the subscription plan for the buyer to pay and subscribe.
#  For more information, see [Subscription Plan
#  t](https://developer.squareup.com/docs/checkout-api/subscription-plan-checkout).
    attr_reader :subscription_plan_id
  # @return [String] The confirmation page URL to redirect the buyer to after Square processes the
#  payment.
    attr_reader :redirect_url
  # @return [String] The email address that buyers can use to contact the seller.
    attr_reader :merchant_support_email
  # @return [Boolean] Indicates whether to include the address fields in the payment form.
    attr_reader :ask_for_shipping_address
  # @return [square.rb::AcceptedPaymentMethods] The methods allowed for buyers during checkout.
    attr_reader :accepted_payment_methods
  # @return [square.rb::Money] The amount of money that the developer is taking as a fee for facilitating the
#  payment on behalf of the seller.
#  The amount cannot be more than 90% of the total amount of the payment.
#  The amount must be specified in the smallest denomination of the applicable
#  currency (for example, US dollar amounts are specified in cents). For more
#  information, see [Working with Monetary
#  squareup.com/docs/build-basics/common-data-types/working-with-monetary-amounts).
#  The fee currency code must match the currency associated with the seller that is
#  accepting the payment. The application must be from a developer account in the
#  same country and using the same currency code as the seller. For more
#  information about the application fee scenario, see [Take Payments and Collect
#  ttps://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
#  To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is
#  required. For more information, see
#  areup.com/docs/payments-api/collect-fees/additional-considerations#permissions).
    attr_reader :app_fee_money
  # @return [square.rb::ShippingFee] The fee associated with shipping to be applied to the `Order` as a service
#  charge.
    attr_reader :shipping_fee
  # @return [Boolean] Indicates whether to include the `Add coupon` section for the buyer to provide a
#  Square marketing coupon in the payment form.
    attr_reader :enable_coupon
  # @return [Boolean] Indicates whether to include the `REWARDS` section for the buyer to opt in to
#  loyalty, redeem rewards in the payment form, or both.
    attr_reader :enable_loyalty
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param allow_tipping [Boolean] Indicates whether the payment allows tipping.
    # @param custom_fields [Array<square.rb::CustomField>] The custom fields requesting information from the buyer.
    # @param subscription_plan_id [String] The ID of the subscription plan for the buyer to pay and subscribe.
#  For more information, see [Subscription Plan
#  t](https://developer.squareup.com/docs/checkout-api/subscription-plan-checkout).
    # @param redirect_url [String] The confirmation page URL to redirect the buyer to after Square processes the
#  payment.
    # @param merchant_support_email [String] The email address that buyers can use to contact the seller.
    # @param ask_for_shipping_address [Boolean] Indicates whether to include the address fields in the payment form.
    # @param accepted_payment_methods [square.rb::AcceptedPaymentMethods] The methods allowed for buyers during checkout.
    # @param app_fee_money [square.rb::Money] The amount of money that the developer is taking as a fee for facilitating the
#  payment on behalf of the seller.
#  The amount cannot be more than 90% of the total amount of the payment.
#  The amount must be specified in the smallest denomination of the applicable
#  currency (for example, US dollar amounts are specified in cents). For more
#  information, see [Working with Monetary
#  squareup.com/docs/build-basics/common-data-types/working-with-monetary-amounts).
#  The fee currency code must match the currency associated with the seller that is
#  accepting the payment. The application must be from a developer account in the
#  same country and using the same currency code as the seller. For more
#  information about the application fee scenario, see [Take Payments and Collect
#  ttps://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
#  To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is
#  required. For more information, see
#  areup.com/docs/payments-api/collect-fees/additional-considerations#permissions).
    # @param shipping_fee [square.rb::ShippingFee] The fee associated with shipping to be applied to the `Order` as a service
#  charge.
    # @param enable_coupon [Boolean] Indicates whether to include the `Add coupon` section for the buyer to provide a
#  Square marketing coupon in the payment form.
    # @param enable_loyalty [Boolean] Indicates whether to include the `REWARDS` section for the buyer to opt in to
#  loyalty, redeem rewards in the payment form, or both.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CheckoutOptions]
    def initialize(allow_tipping: OMIT, custom_fields: OMIT, subscription_plan_id: OMIT, redirect_url: OMIT, merchant_support_email: OMIT, ask_for_shipping_address: OMIT, accepted_payment_methods: OMIT, app_fee_money: OMIT, shipping_fee: OMIT, enable_coupon: OMIT, enable_loyalty: OMIT, additional_properties: nil)
      @allow_tipping = allow_tipping if allow_tipping != OMIT
      @custom_fields = custom_fields if custom_fields != OMIT
      @subscription_plan_id = subscription_plan_id if subscription_plan_id != OMIT
      @redirect_url = redirect_url if redirect_url != OMIT
      @merchant_support_email = merchant_support_email if merchant_support_email != OMIT
      @ask_for_shipping_address = ask_for_shipping_address if ask_for_shipping_address != OMIT
      @accepted_payment_methods = accepted_payment_methods if accepted_payment_methods != OMIT
      @app_fee_money = app_fee_money if app_fee_money != OMIT
      @shipping_fee = shipping_fee if shipping_fee != OMIT
      @enable_coupon = enable_coupon if enable_coupon != OMIT
      @enable_loyalty = enable_loyalty if enable_loyalty != OMIT
      @additional_properties = additional_properties
      @_field_set = { "allow_tipping": allow_tipping, "custom_fields": custom_fields, "subscription_plan_id": subscription_plan_id, "redirect_url": redirect_url, "merchant_support_email": merchant_support_email, "ask_for_shipping_address": ask_for_shipping_address, "accepted_payment_methods": accepted_payment_methods, "app_fee_money": app_fee_money, "shipping_fee": shipping_fee, "enable_coupon": enable_coupon, "enable_loyalty": enable_loyalty }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CheckoutOptions
    #
    # @param json_object [String] 
    # @return [square.rb::CheckoutOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      allow_tipping = parsed_json["allow_tipping"]
      custom_fields = parsed_json["custom_fields"]&.map do | item |
  item = item.to_json
  square.rb::CustomField.from_json(json_object: item)
end
      subscription_plan_id = parsed_json["subscription_plan_id"]
      redirect_url = parsed_json["redirect_url"]
      merchant_support_email = parsed_json["merchant_support_email"]
      ask_for_shipping_address = parsed_json["ask_for_shipping_address"]
      unless parsed_json["accepted_payment_methods"].nil?
        accepted_payment_methods = parsed_json["accepted_payment_methods"].to_json
        accepted_payment_methods = square.rb::AcceptedPaymentMethods.from_json(json_object: accepted_payment_methods)
      else
        accepted_payment_methods = nil
      end
      unless parsed_json["app_fee_money"].nil?
        app_fee_money = parsed_json["app_fee_money"].to_json
        app_fee_money = square.rb::Money.from_json(json_object: app_fee_money)
      else
        app_fee_money = nil
      end
      unless parsed_json["shipping_fee"].nil?
        shipping_fee = parsed_json["shipping_fee"].to_json
        shipping_fee = square.rb::ShippingFee.from_json(json_object: shipping_fee)
      else
        shipping_fee = nil
      end
      enable_coupon = parsed_json["enable_coupon"]
      enable_loyalty = parsed_json["enable_loyalty"]
      new(
        allow_tipping: allow_tipping,
        custom_fields: custom_fields,
        subscription_plan_id: subscription_plan_id,
        redirect_url: redirect_url,
        merchant_support_email: merchant_support_email,
        ask_for_shipping_address: ask_for_shipping_address,
        accepted_payment_methods: accepted_payment_methods,
        app_fee_money: app_fee_money,
        shipping_fee: shipping_fee,
        enable_coupon: enable_coupon,
        enable_loyalty: enable_loyalty,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutOptions to a JSON object
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
      obj.allow_tipping&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_tipping is not the expected type, validation failed.")
      obj.custom_fields&.is_a?(Array) != false || raise("Passed value for field obj.custom_fields is not the expected type, validation failed.")
      obj.subscription_plan_id&.is_a?(String) != false || raise("Passed value for field obj.subscription_plan_id is not the expected type, validation failed.")
      obj.redirect_url&.is_a?(String) != false || raise("Passed value for field obj.redirect_url is not the expected type, validation failed.")
      obj.merchant_support_email&.is_a?(String) != false || raise("Passed value for field obj.merchant_support_email is not the expected type, validation failed.")
      obj.ask_for_shipping_address&.is_a?(Boolean) != false || raise("Passed value for field obj.ask_for_shipping_address is not the expected type, validation failed.")
      obj.accepted_payment_methods.nil? || square.rb::AcceptedPaymentMethods.validate_raw(obj: obj.accepted_payment_methods)
      obj.app_fee_money.nil? || square.rb::Money.validate_raw(obj: obj.app_fee_money)
      obj.shipping_fee.nil? || square.rb::ShippingFee.validate_raw(obj: obj.shipping_fee)
      obj.enable_coupon&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_coupon is not the expected type, validation failed.")
      obj.enable_loyalty&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_loyalty is not the expected type, validation failed.")
    end
  end
end