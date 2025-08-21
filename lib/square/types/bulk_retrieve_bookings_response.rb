# frozen_string_literal: true

module Square
  module Types
    # Response payload for bulk retrieval of bookings.
    class BulkRetrieveBookingsResponse < Internal::Types::Model
      field :bookings, lambda {
        Internal::Types::Hash[String, Square::Types::GetBookingResponse]
      }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
