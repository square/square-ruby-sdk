# frozen_string_literal: true

module Square
    module Types
        # Configuration associated with Custom Attribute Definitions of type `STRING`.
        class CatalogCustomAttributeDefinitionStringConfig < Square::Internal::Types::Model
            field :enforce_uniqueness, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
