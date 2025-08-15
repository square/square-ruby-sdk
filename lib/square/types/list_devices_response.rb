# frozen_string_literal: true

module Square
  class ListDevicesResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :devices, Internal::Types::Array[Square::Device], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false

  end
end
