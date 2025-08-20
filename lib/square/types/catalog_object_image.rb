# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectImage < Internal::Types::Model
      field :image_data, -> { Square::Types::CatalogImage }, optional: true, nullable: false
    end
  end
end
