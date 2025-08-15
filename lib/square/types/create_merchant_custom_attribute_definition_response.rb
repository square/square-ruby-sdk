# frozen_string_literal: true

module Square
  # Represents a [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) response.
  # Either `custom_attribute_definition` or `errors` is present in the response.
  class CreateMerchantCustomAttributeDefinitionResponse < Internal::Types::Model
    field :custom_attribute_definition, Square::CustomAttributeDefinition, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
