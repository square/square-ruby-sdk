# frozen_string_literal: true

module Square
    module Types
        class CreateCatalogImageResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :image, Square::CatalogObject, optional: true, nullable: false
        end
    end
end
