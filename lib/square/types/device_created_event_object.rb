# frozen_string_literal: true

module Square
  class DeviceCreatedEventObject < Internal::Types::Model
    field :device, Square::Device, optional: true, nullable: false

  end
end
