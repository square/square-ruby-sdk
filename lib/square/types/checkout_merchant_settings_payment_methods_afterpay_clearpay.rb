# frozen_string_literal: true

module Square
  module Types
    # The settings allowed for AfterpayClearpay.
    class CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay < Internal::Types::Model
      field :order_eligibility_range, -> { Square::Types::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange }, optional: true, nullable: false
      field :item_eligibility_range, -> { Square::Types::CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

    end
  end
end
