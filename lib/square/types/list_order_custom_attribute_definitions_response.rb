# frozen_string_literal: true

module Square
  module Types
    # Represents a response from listing order custom attribute definitions.
    class ListOrderCustomAttributeDefinitionsResponse < Internal::Types::Model
      field :custom_attribute_definitions, Internal::Types::Array[Square::Types::CustomAttributeDefinition], optional: false, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
