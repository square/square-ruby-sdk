# frozen_string_literal: true

module Square
    module Types
        class CheckoutOptions < Square::Internal::Types::Model
            field :allow_tipping, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :custom_fields, Square::Internal::Types::Array[Square::CustomField], optional: true, nullable: false
            field :subscription_plan_id, String, optional: true, nullable: false
            field :redirect_url, String, optional: true, nullable: false
            field :merchant_support_email, String, optional: true, nullable: false
            field :ask_for_shipping_address, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :accepted_payment_methods, Square::AcceptedPaymentMethods, optional: true, nullable: false
            field :app_fee_money, Square::Money, optional: true, nullable: false
            field :shipping_fee, Square::ShippingFee, optional: true, nullable: false
            field :enable_coupon, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :enable_loyalty, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
