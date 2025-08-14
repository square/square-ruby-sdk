# frozen_string_literal: true

module Square
    module Types
        # The query filter to return the items containing the specified tax IDs.
        class CatalogQueryItemsForTax < Internal::Types::Model
            field :tax_ids, Internal::Types::Array[String], optional: false, nullable: false
        end
    end
end
