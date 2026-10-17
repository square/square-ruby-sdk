# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectItem < CatalogObjectBase
      field :item_data, -> { Square::Types::CatalogItem }, optional: true, nullable: false
    end
  end
end
