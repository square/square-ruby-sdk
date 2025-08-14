# frozen_string_literal: true

module Square
    module Types
        class UpdateMerchantSettingsResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :merchant_settings, Square::CheckoutMerchantSettings, optional: true, nullable: false
        end
    end
end
