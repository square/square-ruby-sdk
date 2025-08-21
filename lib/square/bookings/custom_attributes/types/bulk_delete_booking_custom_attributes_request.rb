# frozen_string_literal: true

module Square
  module Bookings
    module CustomAttributes
      module Types
        class BulkDeleteBookingCustomAttributesRequest < Internal::Types::Model
          field :values, lambda {
            Internal::Types::Hash[String, Square::Types::BookingCustomAttributeDeleteRequest]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
