# frozen_string_literal: true

module Square
    module Types
        class CheckoutMerchantSettings < Square::Internal::Types::Model
            field :payment_methods, Square::CheckoutMerchantSettingsPaymentMethods, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
        end
    end
end
