# frozen_string_literal: true

module Square
  class CreateDeviceCodeResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :device_code, Square::DeviceCode, optional: true, nullable: false

  end
end
