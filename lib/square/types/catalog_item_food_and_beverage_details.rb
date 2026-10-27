# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The food and beverage-specific details of a `FOOD_AND_BEV` item.
    class CatalogItemFoodAndBeverageDetails < Internal::Types::Model
      field :calorie_count, -> { Integer }, optional: true, nullable: true

      field :dietary_preferences, -> { Internal::Types::Array[Square::Types::CatalogItemFoodAndBeverageDetailsDietaryPreference] }, optional: true, nullable: true

      field :ingredients, -> { Internal::Types::Array[Square::Types::CatalogItemFoodAndBeverageDetailsIngredient] }, optional: true, nullable: true
    end
  end
end
