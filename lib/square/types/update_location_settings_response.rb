# frozen_string_literal: true

module Square
  module Types
    class UpdateLocationSettingsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :location_settings, Square::Types::CheckoutLocationSettings, optional: true, nullable: false

    end
  end
end
