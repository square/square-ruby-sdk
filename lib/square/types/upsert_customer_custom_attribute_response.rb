# frozen_string_literal: true

module Square
  module Types
    # Represents an [UpsertCustomerCustomAttribute](api-endpoint:CustomerCustomAttributes-UpsertCustomerCustomAttribute) response.
    # Either `custom_attribute_definition` or `errors` is present in the response.
    class UpsertCustomerCustomAttributeResponse < Internal::Types::Model
      field :custom_attribute, -> { Square::Types::CustomAttribute }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
