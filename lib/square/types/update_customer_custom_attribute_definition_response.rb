# frozen_string_literal: true

module Square
  module Types
    # Represents an [UpdateCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-UpdateCustomerCustomAttributeDefinition) response.
    # Either `custom_attribute_definition` or `errors` is present in the response.
    class UpdateCustomerCustomAttributeDefinitionResponse < Internal::Types::Model
      field :custom_attribute_definition, Square::CustomAttributeDefinition, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
