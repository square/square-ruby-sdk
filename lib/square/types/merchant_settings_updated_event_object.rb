# frozen_string_literal: true

module Square
  class MerchantSettingsUpdatedEventObject < Internal::Types::Model
    field :merchant_settings, Square::CheckoutMerchantSettings, optional: true, nullable: false

  end
end
