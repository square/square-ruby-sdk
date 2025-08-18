# frozen_string_literal: true

module Square
  module Types
    class CheckoutMerchantSettingsPaymentMethods < Internal::Types::Model
      field :apple_pay, Square::Types::CheckoutMerchantSettingsPaymentMethodsPaymentMethod, optional: true, nullable: false
      field :google_pay, Square::Types::CheckoutMerchantSettingsPaymentMethodsPaymentMethod, optional: true, nullable: false
      field :cash_app, Square::Types::CheckoutMerchantSettingsPaymentMethodsPaymentMethod, optional: true, nullable: false
      field :afterpay_clearpay, Square::Types::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay, optional: true, nullable: false

    end
  end
end
