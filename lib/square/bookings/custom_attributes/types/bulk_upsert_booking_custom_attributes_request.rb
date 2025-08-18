
module Square
  module Bookings
    module CustomAttributes
      module Types
        class BulkUpsertBookingCustomAttributesRequest < Internal::Types::Model
          field :values, Internal::Types::Hash[String, Square::Types::BookingCustomAttributeUpsertRequest], optional: false, nullable: false

        end
      end
    end
  end
end
