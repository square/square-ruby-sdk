# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectProductSet < CatalogObjectBase
      field :product_set_data, -> { Square::Types::CatalogProductSet }, optional: true, nullable: false
    end
  end
end
