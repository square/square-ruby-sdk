# frozen_string_literal: true

module Square
    module Types
        # Represents an individual delete response in a [BulkDeleteMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkDeleteMerchantCustomAttributes)
        # request.
        class BulkDeleteMerchantCustomAttributesResponseMerchantCustomAttributeDeleteResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
