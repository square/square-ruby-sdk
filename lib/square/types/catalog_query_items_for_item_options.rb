# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The query filter to return the items containing the specified item option IDs.
    class CatalogQueryItemsForItemOptions < Internal::Types::Model
      field :item_option_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true
    end
  end
end
