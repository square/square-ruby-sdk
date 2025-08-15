# frozen_string_literal: true

module Square
  # Represents a response from deleting an order custom attribute definition.
  class DeleteOrderCustomAttributeDefinitionResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
