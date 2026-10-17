# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectDiscount < CatalogObjectBase
      field :discount_data, -> { Square::Types::CatalogDiscount }, optional: true, nullable: false
    end
  end
end
