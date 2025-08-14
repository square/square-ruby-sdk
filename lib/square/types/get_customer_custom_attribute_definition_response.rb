# frozen_string_literal: true

module Square
    module Types
        # Represents a [RetrieveCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-RetrieveCustomerCustomAttributeDefinition) response.
        # Either `custom_attribute_definition` or `errors` is present in the response.
        class GetCustomerCustomAttributeDefinitionResponse < Square::Internal::Types::Model
            field :custom_attribute_definition, Square::CustomAttributeDefinition, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
