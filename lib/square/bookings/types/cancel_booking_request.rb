# frozen_string_literal: true

module Square
  module Bookings
    module Types
      class CancelBookingRequest < Internal::Types::Model
        field :booking_id, -> { String }, optional: false, nullable: false

        field :idempotency_key, -> { String }, optional: true, nullable: true

        field :booking_version, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
