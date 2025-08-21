# frozen_string_literal: true

module Square
  module Bookings
    module Types
      class GetBookingsRequest < Internal::Types::Model
        field :booking_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
