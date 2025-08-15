# frozen_string_literal: true

module Square
  class DeviceComponentDetailsBatteryDetails < Internal::Types::Model
    field :visible_percent, Integer, optional: true, nullable: false
    field :external_power, Square::DeviceComponentDetailsExternalPower, optional: true, nullable: false

  end
end
