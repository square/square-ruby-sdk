# frozen_string_literal: true

module Square
  module Types
    class DeviceStatus < Internal::Types::Model
      field :category, Square::DeviceStatusCategory, optional: true, nullable: false

    end
  end
end
