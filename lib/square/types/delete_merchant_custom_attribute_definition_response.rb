# frozen_string_literal: true

module Square
    module Types
        # Represents a response from a delete request containing error messages if there are any.
        class DeleteMerchantCustomAttributeDefinitionResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
