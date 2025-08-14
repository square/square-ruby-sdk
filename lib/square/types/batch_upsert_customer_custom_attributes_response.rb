# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkUpsertCustomerCustomAttributes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes) response,
        # which contains a map of responses that each corresponds to an individual upsert request.
        class BatchUpsertCustomerCustomAttributesResponse < Square::Internal::Types::Model
            field :values, Square::Internal::Types::Hash[String, Square::BatchUpsertCustomerCustomAttributesResponseCustomerCustomAttributeUpsertResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
