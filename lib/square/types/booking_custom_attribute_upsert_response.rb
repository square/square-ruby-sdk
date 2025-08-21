# frozen_string_literal: true

module Square
  module Types
    # Represents a response for an individual upsert request in a [BulkUpsertBookingCustomAttributes](api-endpoint:BookingCustomAttributes-BulkUpsertBookingCustomAttributes) operation.
    class BookingCustomAttributeUpsertResponse < Internal::Types::Model
      field :booking_id, -> { String }, optional: true, nullable: false
      field :custom_attribute, -> { Square::Types::CustomAttribute }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
