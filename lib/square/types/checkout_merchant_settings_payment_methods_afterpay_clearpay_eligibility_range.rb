# frozen_string_literal: true

module Square
  module Types
    # A range of purchase price that qualifies.
    class CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange < Internal::Types::Model
      field :min, -> { Square::Types::Money }, optional: false, nullable: false
      field :max, -> { Square::Types::Money }, optional: false, nullable: false
    end
  end
end
