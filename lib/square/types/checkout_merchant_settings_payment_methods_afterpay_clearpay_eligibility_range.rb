# frozen_string_literal: true

module Square
  # A range of purchase price that qualifies.
  class CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange < Internal::Types::Model
    field :min, Square::Money, optional: false, nullable: false
    field :max, Square::Money, optional: false, nullable: false

  end
end
