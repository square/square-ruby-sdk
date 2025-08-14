# frozen_string_literal: true

module Square
    module Types
        # Represents an [UpdateLocationCustomAttributeDefinition](api-endpoint:LocationCustomAttributes-UpdateLocationCustomAttributeDefinition) response.
        # Either `custom_attribute_definition` or `errors` is present in the response.
        class UpdateLocationCustomAttributeDefinitionResponse < Square::Internal::Types::Model
            field :custom_attribute_definition, Square::CustomAttributeDefinition, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
