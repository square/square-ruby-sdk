# frozen_string_literal: true

module Square
  # The query filter to return the items containing the specified tax IDs.
  class CatalogQueryItemsForTax < Internal::Types::Model
    field :tax_ids, Internal::Types::Array[String], optional: false, nullable: false

  end
end
