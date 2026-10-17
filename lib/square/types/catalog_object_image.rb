# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectImage < CatalogObjectBase
      field :image_data, -> { Square::Types::CatalogImage }, optional: true, nullable: false
    end
  end
end
