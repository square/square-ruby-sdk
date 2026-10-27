# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CheckoutMerchantSettings < Internal::Types::Model
      field :payment_methods, -> { Square::Types::CheckoutMerchantSettingsPaymentMethods }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
