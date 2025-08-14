# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkUpsertLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes) response,
        # which contains a map of responses that each corresponds to an individual upsert request.
        class BulkUpsertLocationCustomAttributesResponse < Square::Internal::Types::Model
            field :values, Square::Internal::Types::Hash[String, Square::BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
