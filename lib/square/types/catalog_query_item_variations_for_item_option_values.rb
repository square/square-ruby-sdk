# frozen_string_literal: true

module Square
  module Types
    # The query filter to return the item variations containing the specified item option value IDs.
    class CatalogQueryItemVariationsForItemOptionValues < Internal::Types::Model
      field :item_option_value_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

    end
  end
end
