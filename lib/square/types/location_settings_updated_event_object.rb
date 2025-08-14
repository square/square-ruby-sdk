# frozen_string_literal: true

module Square
    module Types
        class LocationSettingsUpdatedEventObject < Square::Internal::Types::Model
            field :location_settings, Square::CheckoutLocationSettings, optional: true, nullable: false
        end
    end
end
