# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkUpsertMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes) response,
        # which contains a map of responses that each corresponds to an individual upsert request.
        class BulkUpsertMerchantCustomAttributesResponse < Square::Internal::Types::Model
            field :values, Square::Internal::Types::Hash[String, Square::BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
