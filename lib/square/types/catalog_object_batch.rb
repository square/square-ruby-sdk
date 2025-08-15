# frozen_string_literal: true

module Square
  # A batch of catalog objects.
  class CatalogObjectBatch < Internal::Types::Model
    field :objects, Internal::Types::Array[Square::CatalogObject], optional: false, nullable: false

  end
end
