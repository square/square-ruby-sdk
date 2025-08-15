# frozen_string_literal: true

module Square
  class ListDeviceCodesResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :device_codes, Internal::Types::Array[Square::DeviceCode], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false

  end
end
