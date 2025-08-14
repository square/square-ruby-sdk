# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkUpsertBookingCustomAttributes](api-endpoint:BookingCustomAttributes-BulkUpsertBookingCustomAttributes) response,
        # which contains a map of responses that each corresponds to an individual upsert request.
        class BulkUpsertBookingCustomAttributesResponse < Square::Internal::Types::Model
            field :values, Square::Internal::Types::Hash[String, Square::BookingCustomAttributeUpsertResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
