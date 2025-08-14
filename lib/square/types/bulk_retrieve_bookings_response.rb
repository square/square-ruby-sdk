# frozen_string_literal: true

module Square
    module Types
        # Response payload for bulk retrieval of bookings.
        class BulkRetrieveBookingsResponse < Square::Internal::Types::Model
            field :bookings, Square::Internal::Types::Hash[String, Square::GetBookingResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
