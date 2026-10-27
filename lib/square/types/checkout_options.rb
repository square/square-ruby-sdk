# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CheckoutOptions < Internal::Types::Model
      field :allow_tipping, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :custom_fields, -> { Internal::Types::Array[Square::Types::CustomField] }, optional: true, nullable: true

      field :subscription_plan_id, -> { String }, optional: true, nullable: true

      field :redirect_url, -> { String }, optional: true, nullable: true

      field :merchant_support_email, -> { String }, optional: true, nullable: true

      field :ask_for_shipping_address, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :accepted_payment_methods, -> { Square::Types::AcceptedPaymentMethods }, optional: true, nullable: false

      field :app_fee_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :shipping_fee, -> { Square::Types::ShippingFee }, optional: true, nullable: false

      field :enable_coupon, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :enable_loyalty, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
