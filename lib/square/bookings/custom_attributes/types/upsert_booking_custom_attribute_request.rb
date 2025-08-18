
module Square
  module Bookings
    module CustomAttributes
      module Types
        class UpsertBookingCustomAttributeRequest < Internal::Types::Model
          field :booking_id, String, optional: false, nullable: false
          field :key, String, optional: false, nullable: false
          field :custom_attribute, Square::Types::CustomAttribute, optional: false, nullable: false
          field :idempotency_key, String, optional: true, nullable: false

        end
      end
    end
  end
end
