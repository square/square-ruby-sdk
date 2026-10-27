# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class LocationSettingsUpdatedEventObject < Internal::Types::Model
      field :location_settings, -> { Square::Types::CheckoutLocationSettings }, optional: true, nullable: false
    end
  end
end
