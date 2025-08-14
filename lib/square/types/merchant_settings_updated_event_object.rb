# frozen_string_literal: true

module Square
    module Types
        class MerchantSettingsUpdatedEventObject < Internal::Types::Model
            field :merchant_settings, Square::CheckoutMerchantSettings, optional: true, nullable: false
        end
    end
end
