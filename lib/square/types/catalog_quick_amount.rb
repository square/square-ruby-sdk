# frozen_string_literal: true

module Square
  module Types
    # Represents a Quick Amount in the Catalog.
    class CatalogQuickAmount < Internal::Types::Model
      field :type, Square::Types::CatalogQuickAmountType, optional: false, nullable: false
      field :amount, Square::Types::Money, optional: false, nullable: false
      field :score, Integer, optional: true, nullable: false
      field :ordinal, Integer, optional: true, nullable: false

    end
  end
end
