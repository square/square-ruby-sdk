# frozen_string_literal: true

module Square
    module Types
        # The settings allowed for a payment method.
        class CheckoutMerchantSettingsPaymentMethodsPaymentMethod < Square::Internal::Types::Model
            field :enabled, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
