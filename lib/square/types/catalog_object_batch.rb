# frozen_string_literal: true

module Square
  module Types
    # A batch of catalog objects.
    class CatalogObjectBatch < Internal::Types::Model
      field :objects, Internal::Types::Array[Square::CatalogObject], optional: false, nullable: false

    end
  end
end
