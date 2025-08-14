# frozen_string_literal: true

module Square
    module Types
        # A batch of catalog objects.
        class CatalogObjectBatch < Square::Internal::Types::Model
            field :objects, Square::Internal::Types::Array[Square::CatalogObject], optional: false, nullable: false
        end
    end
end
