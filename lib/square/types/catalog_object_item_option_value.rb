# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectItemOptionValue < Internal::Types::Model
      field :item_option_value_data, Square::Types::CatalogItemOptionValue, optional: true, nullable: false

    end
  end
end
