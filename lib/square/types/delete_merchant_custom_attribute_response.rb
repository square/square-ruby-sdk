# frozen_string_literal: true

module Square
    module Types
        # Represents a [DeleteMerchantCustomAttribute](api-endpoint:MerchantCustomAttributes-DeleteMerchantCustomAttribute) response.
        # Either an empty object `{}` (for a successful deletion) or `errors` is present in the response.
        class DeleteMerchantCustomAttributeResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
