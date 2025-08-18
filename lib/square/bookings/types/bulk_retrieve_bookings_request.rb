
module Square
  module Bookings
    module Types
      class BulkRetrieveBookingsRequest < Internal::Types::Model
        field :booking_ids, Internal::Types::Array[String], optional: false, nullable: false

      end
    end
  end
end
