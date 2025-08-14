# frozen_string_literal: true

module Square
    module Types
        class ListCatalogResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :objects, Square::Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
        end
    end
end
