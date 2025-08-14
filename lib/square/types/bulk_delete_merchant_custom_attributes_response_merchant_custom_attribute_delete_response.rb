# frozen_string_literal: true

module Square
    module Types
        # Represents an individual delete response in a [BulkDeleteMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkDeleteMerchantCustomAttributes)
        # request.
        class BulkDeleteMerchantCustomAttributesResponseMerchantCustomAttributeDeleteResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
