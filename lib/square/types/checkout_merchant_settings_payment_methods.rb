# frozen_string_literal: true

module Square
    module Types
        class CheckoutMerchantSettingsPaymentMethods < Square::Internal::Types::Model
            field :apple_pay, Square::CheckoutMerchantSettingsPaymentMethodsPaymentMethod, optional: true, nullable: false
            field :google_pay, Square::CheckoutMerchantSettingsPaymentMethodsPaymentMethod, optional: true, nullable: false
            field :cash_app, Square::CheckoutMerchantSettingsPaymentMethodsPaymentMethod, optional: true, nullable: false
            field :afterpay_clearpay, Square::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay, optional: true, nullable: false
        end
    end
end
