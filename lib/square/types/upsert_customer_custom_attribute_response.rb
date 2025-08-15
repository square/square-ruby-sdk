# frozen_string_literal: true

module Square
  # Represents an [UpsertCustomerCustomAttribute](api-endpoint:CustomerCustomAttributes-UpsertCustomerCustomAttribute) response.
  # Either `custom_attribute_definition` or `errors` is present in the response.
  class UpsertCustomerCustomAttributeResponse < Internal::Types::Model
    field :custom_attribute, Square::CustomAttribute, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
