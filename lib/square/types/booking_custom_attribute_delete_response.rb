# frozen_string_literal: true

module Square
  module Types
    # Represents a response for an individual upsert request in a [BulkDeleteBookingCustomAttributes](api-endpoint:BookingCustomAttributes-BulkDeleteBookingCustomAttributes) operation.
    class BookingCustomAttributeDeleteResponse < Internal::Types::Model
      field :booking_id, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
