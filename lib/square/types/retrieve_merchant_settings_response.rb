# frozen_string_literal: true

module Square
    module Types
        class RetrieveMerchantSettingsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :merchant_settings, Square::CheckoutMerchantSettings, optional: true, nullable: false
        end
    end
end
