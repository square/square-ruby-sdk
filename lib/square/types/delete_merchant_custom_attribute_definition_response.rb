# frozen_string_literal: true

module Square
    module Types
        # Represents a response from a delete request containing error messages if there are any.
        class DeleteMerchantCustomAttributeDefinitionResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
