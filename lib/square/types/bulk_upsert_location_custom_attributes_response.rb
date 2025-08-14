# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkUpsertLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes) response,
        # which contains a map of responses that each corresponds to an individual upsert request.
        class BulkUpsertLocationCustomAttributesResponse < Internal::Types::Model
            field :values, Internal::Types::Hash[String, Square::BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse], optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
