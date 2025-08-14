# frozen_string_literal: true

module Square
    module Types
        # Represents a [DeleteLocationCustomAttribute](api-endpoint:LocationCustomAttributes-DeleteLocationCustomAttribute) response.
        # Either an empty object `{}` (for a successful deletion) or `errors` is present in the response.
        class DeleteLocationCustomAttributeResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
