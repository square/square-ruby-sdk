# frozen_string_literal: true

module Square
    module Types
        # Represents a [DeleteCustomerCustomAttribute](api-endpoint:CustomerCustomAttributes-DeleteCustomerCustomAttribute) response.
        # Either an empty object `{}` (for a successful deletion) or `errors` is present in the response.
        class DeleteCustomerCustomAttributeResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
