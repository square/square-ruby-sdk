# frozen_string_literal: true

module Square
  module Types
    class GetDeviceCodeResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :device_code, Square::Types::DeviceCode, optional: true, nullable: false

    end
  end
end
