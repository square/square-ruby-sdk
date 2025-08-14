# frozen_string_literal: true

module Square
    module Types
        class SearchCatalogObjectsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :objects, Square::Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
            field :related_objects, Square::Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
            field :latest_time, String, optional: true, nullable: false
        end
    end
end
