# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class RetrieveLocationSettingsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

      field :location_settings, -> { Square::Types::CheckoutLocationSettings }, optional: true, nullable: false
    end
  end
end
