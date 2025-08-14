# frozen_string_literal: true

module Square
    module Types
        # Represents a response from updating an order custom attribute definition.
        class UpdateOrderCustomAttributeDefinitionResponse < Square::Internal::Types::Model
            field :custom_attribute_definition, Square::CustomAttributeDefinition, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
