# frozen_string_literal: true

module Square
  module Types
    class CustomAttributeDefinitionEventDataObject < Internal::Types::Model
      field :custom_attribute_definition, -> { Square::Types::CustomAttributeDefinition }, optional: true, nullable: false

    end
  end
end
