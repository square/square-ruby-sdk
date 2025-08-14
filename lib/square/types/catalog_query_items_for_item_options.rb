# frozen_string_literal: true

module Square
    module Types
        # The query filter to return the items containing the specified item option IDs.
        class CatalogQueryItemsForItemOptions < Square::Internal::Types::Model
            field :item_option_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
