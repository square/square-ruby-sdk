# frozen_string_literal: true

module Square
  module Types
    class ListBookingsResponse < Internal::Types::Model
      field :bookings, Internal::Types::Array[Square::Types::Booking], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
