# frozen_string_literal: true

module Square
    module Types
        class CustomAttributeDefinitionEventDataObject < Square::Internal::Types::Model
            field :custom_attribute_definition, Square::CustomAttributeDefinition, optional: true, nullable: false
        end
    end
end
