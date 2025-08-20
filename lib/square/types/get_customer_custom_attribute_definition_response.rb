# frozen_string_literal: true

module Square
  module Types
    # Represents a [RetrieveCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-RetrieveCustomerCustomAttributeDefinition) response.
    # Either `custom_attribute_definition` or `errors` is present in the response.
    class GetCustomerCustomAttributeDefinitionResponse < Internal::Types::Model
      field :custom_attribute_definition, lambda {
        Square::Types::CustomAttributeDefinition
      }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
