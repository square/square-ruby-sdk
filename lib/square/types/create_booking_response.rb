# frozen_string_literal: true

module Square
    module Types
        class CreateBookingResponse < Internal::Types::Model
            field :booking, Square::Booking, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
