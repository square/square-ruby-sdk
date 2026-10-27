# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceComponentDetailsBatteryDetails < Internal::Types::Model
      field :visible_percent, -> { Integer }, optional: true, nullable: true

      field :external_power, -> { Square::Types::DeviceComponentDetailsExternalPower }, optional: true, nullable: false
    end
  end
end
