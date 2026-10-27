# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class MerchantSettingsUpdatedEventObject < Internal::Types::Model
      field :merchant_settings, -> { Square::Types::CheckoutMerchantSettings }, optional: true, nullable: false
    end
  end
end
