# frozen_string_literal: true

module Square
    module Types
        class BookingCreatedEventObject < Square::Internal::Types::Model
            field :booking, Square::Booking, optional: true, nullable: false
        end
    end
end
