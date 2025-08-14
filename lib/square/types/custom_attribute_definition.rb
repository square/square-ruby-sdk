# frozen_string_literal: true

module Square
    module Types
        # Represents a definition for custom attribute values. A custom attribute definition
        # specifies the key, visibility, schema, and other properties for a custom attribute.
        class CustomAttributeDefinition < Internal::Types::Model
            field :key, String, optional: true, nullable: false
            field :schema, Internal::Types::Hash[String, Internal::Types::Hash[String, ]], optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :description, String, optional: true, nullable: false
            field :visibility, Square::CustomAttributeDefinitionVisibility, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
        end
    end
end
