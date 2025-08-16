# frozen_string_literal: true

module Square
  module Types
    class GetDeviceResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :device, Square::Device, optional: true, nullable: false

    end
  end
end
