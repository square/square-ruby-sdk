# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectItemOption < Internal::Types::Model
      field :item_option_data, -> { Square::Types::CatalogItemOption }, optional: true, nullable: false

    end
  end
end
