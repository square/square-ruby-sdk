# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A modifier that can be applied to items at the time of sale. For example, a cheese modifier for a burger, or a
    # flavor modifier for a serving of ice cream.
    class CatalogModifier < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :on_by_default, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :ordinal, -> { Integer }, optional: true, nullable: true

      field :modifier_list_id, -> { String }, optional: true, nullable: true

      field :location_overrides, -> { Internal::Types::Array[Square::Types::ModifierLocationOverrides] }, optional: true, nullable: true

      field :kitchen_name, -> { String }, optional: true, nullable: true

      field :image_id, -> { String }, optional: true, nullable: true

      field :hidden_online, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :child_modifier_list_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true
    end
  end
end
