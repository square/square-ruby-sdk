# frozen_string_literal: true

module Square
  # Location-specific overrides for specified properties of a `CatalogModifier` object.
  class ModifierLocationOverrides < Internal::Types::Model
    field :location_id, String, optional: true, nullable: false
    field :price_money, Square::Money, optional: true, nullable: false
    field :sold_out, Internal::Types::Boolean, optional: true, nullable: false

  end
end
