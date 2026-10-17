# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectItemVariation < CatalogObjectBase
      field :item_variation_data, -> { Square::Types::CatalogItemVariation }, optional: true, nullable: false
    end
  end
end
