# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkDeleteMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkDeleteMerchantCustomAttributes) response,
        # which contains a map of responses that each corresponds to an individual delete request.
        class BulkDeleteMerchantCustomAttributesResponse < Internal::Types::Model
            field :values, Internal::Types::Hash[String, Square::BulkDeleteMerchantCustomAttributesResponseMerchantCustomAttributeDeleteResponse], optional: false, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
