# frozen_string_literal: true

module Square
    module Types
        class UpsertCatalogObjectResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :catalog_object, Square::CatalogObject, optional: true, nullable: false
            field :id_mappings, Square::Internal::Types::Array[Square::CatalogIdMapping], optional: true, nullable: false
        end
    end
end
