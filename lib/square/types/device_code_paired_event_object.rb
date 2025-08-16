# frozen_string_literal: true

module Square
  module Types
    class DeviceCodePairedEventObject < Internal::Types::Model
      field :device_code, Square::DeviceCode, optional: true, nullable: false

    end
  end
end
