# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The settings allowed for a payment method.
    class CheckoutMerchantSettingsPaymentMethodsPaymentMethod < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
