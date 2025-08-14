# frozen_string_literal: true

module Square
    module Types
        class UpdateLocationSettingsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :location_settings, Square::CheckoutLocationSettings, optional: true, nullable: false
        end
    end
end
