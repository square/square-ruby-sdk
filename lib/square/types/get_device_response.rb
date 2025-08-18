# frozen_string_literal: true

module Square
  module Types
    class GetDeviceResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :device, Square::Types::Device, optional: true, nullable: false

    end
  end
end
