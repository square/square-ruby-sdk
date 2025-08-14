# frozen_string_literal: true

module Square
    module Types
        # Response payload for bulk retrieval of bookings.
        class BulkRetrieveBookingsResponse < Internal::Types::Model
            field :bookings, Internal::Types::Hash[String, Square::GetBookingResponse], optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
