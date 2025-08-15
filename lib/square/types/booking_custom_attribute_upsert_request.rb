# frozen_string_literal: true

module Square
  # Represents an individual upsert request in a [BulkUpsertBookingCustomAttributes](api-endpoint:BookingCustomAttributes-BulkUpsertBookingCustomAttributes)
  # request. An individual request contains a booking ID, the custom attribute to create or update,
  # and an optional idempotency key.
  class BookingCustomAttributeUpsertRequest < Internal::Types::Model
    field :booking_id, String, optional: false, nullable: false
    field :custom_attribute, Square::CustomAttribute, optional: false, nullable: false
    field :idempotency_key, String, optional: true, nullable: false

  end
end
