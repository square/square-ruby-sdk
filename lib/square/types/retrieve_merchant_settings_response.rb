# frozen_string_literal: true

module Square
  module Types
    class RetrieveMerchantSettingsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :merchant_settings, Square::Types::CheckoutMerchantSettings, optional: true, nullable: false

    end
  end
end
