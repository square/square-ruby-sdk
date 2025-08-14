# frozen_string_literal: true

module Square
    module Types
        # A range of purchase price that qualifies.
        class CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange < Square::Internal::Types::Model
            field :min, Square::Money, optional: false, nullable: false
            field :max, Square::Money, optional: false, nullable: false
        end
    end
end
