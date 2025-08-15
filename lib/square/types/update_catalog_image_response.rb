# frozen_string_literal: true

module Square
  class UpdateCatalogImageResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :image, Square::CatalogObject, optional: true, nullable: false

  end
end
