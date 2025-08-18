# frozen_string_literal: true

module Square
  module Types
    # Configuration associated with Custom Attribute Definitions of type `STRING`.
    class CatalogCustomAttributeDefinitionStringConfig < Internal::Types::Model
      field :enforce_uniqueness, -> { Internal::Types::Boolean }, optional: true, nullable: false

    end
  end
end
