# frozen_string_literal: true

module Square
    module Types
        class BatchUpsertCatalogObjectsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :objects, Square::Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :id_mappings, Square::Internal::Types::Array[Square::CatalogIdMapping], optional: true, nullable: false
        end
    end
end
