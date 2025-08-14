# frozen_string_literal: true

module Square
    module Types
        # A custom attribute value. Each custom attribute value has a corresponding
        # `CustomAttributeDefinition` object.
        class CustomAttribute < Internal::Types::Model
            field :key, String, optional: true, nullable: false
            field :value, Internal::Types::Hash[String, ], optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :visibility, Square::CustomAttributeDefinitionVisibility, optional: true, nullable: false
            field :definition, Square::CustomAttributeDefinition, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
        end
    end
end
