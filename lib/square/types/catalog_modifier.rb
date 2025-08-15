# frozen_string_literal: true

module Square
  # A modifier that can be applied to items at the time of sale. For example, a cheese modifier for a burger, or a flavor modifier for a serving of ice cream.
  class CatalogModifier < Internal::Types::Model
    field :name, String, optional: true, nullable: false
    field :price_money, Square::Money, optional: true, nullable: false
    field :on_by_default, Internal::Types::Boolean, optional: true, nullable: false
    field :ordinal, Integer, optional: true, nullable: false
    field :modifier_list_id, String, optional: true, nullable: false
    field :location_overrides, Internal::Types::Array[Square::ModifierLocationOverrides], optional: true, nullable: false
    field :image_id, String, optional: true, nullable: false
    field :hidden_online, Internal::Types::Boolean, optional: true, nullable: false

  end
end
