# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectItem < Internal::Types::Model
      field :item_data, -> { Square::Types::CatalogItem }, optional: true, nullable: false
    end
  end
end
