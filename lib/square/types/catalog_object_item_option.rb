# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectItemOption < CatalogObjectBase
      field :item_option_data, -> { Square::Types::CatalogItemOption }, optional: true, nullable: false
    end
  end
end
