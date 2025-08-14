# frozen_string_literal: true

module Square
    module Types
        # Represents a response from listing order custom attribute definitions.
        class ListOrderCustomAttributeDefinitionsResponse < Square::Internal::Types::Model
            field :custom_attribute_definitions, Square::Internal::Types::Array[Square::CustomAttributeDefinition], optional: false, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
