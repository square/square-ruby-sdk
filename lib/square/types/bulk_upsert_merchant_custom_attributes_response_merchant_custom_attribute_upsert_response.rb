# frozen_string_literal: true

module Square
    module Types
        # Represents a response for an individual upsert request in a [BulkUpsertMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes) operation.
        class BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse < Square::Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :custom_attribute, Square::CustomAttribute, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
