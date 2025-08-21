# frozen_string_literal: true

module Square
  module Types
    # Represents a [BulkUpsertBookingCustomAttributes](api-endpoint:BookingCustomAttributes-BulkUpsertBookingCustomAttributes) response,
    # which contains a map of responses that each corresponds to an individual upsert request.
    class BulkUpsertBookingCustomAttributesResponse < Internal::Types::Model
      field :values, lambda {
        Internal::Types::Hash[String, Square::Types::BookingCustomAttributeUpsertResponse]
      }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
