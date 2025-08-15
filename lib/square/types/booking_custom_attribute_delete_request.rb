# frozen_string_literal: true

module Square
  # Represents an individual delete request in a [BulkDeleteBookingCustomAttributes](api-endpoint:BookingCustomAttributes-BulkDeleteBookingCustomAttributes)
  # request. An individual request contains a booking ID, the custom attribute to delete, and an optional idempotency key.
  class BookingCustomAttributeDeleteRequest < Internal::Types::Model
    field :booking_id, String, optional: false, nullable: false
    field :key, String, optional: false, nullable: false

  end
end
