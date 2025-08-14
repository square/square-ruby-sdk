# frozen_string_literal: true

module Square
    module Types
        class ListBookingsResponse < Square::Internal::Types::Model
            field :bookings, Square::Internal::Types::Array[Square::Booking], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
