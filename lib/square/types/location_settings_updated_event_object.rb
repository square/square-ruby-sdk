# frozen_string_literal: true

module Square
  module Types
    class LocationSettingsUpdatedEventObject < Internal::Types::Model
      field :location_settings, Square::Types::CheckoutLocationSettings, optional: true, nullable: false

    end
  end
end
