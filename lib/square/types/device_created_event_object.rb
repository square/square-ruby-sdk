# frozen_string_literal: true

module Square
  module Types
    class DeviceCreatedEventObject < Internal::Types::Model
      field :device, -> { Square::Types::Device }, optional: true, nullable: false
    end
  end
end
