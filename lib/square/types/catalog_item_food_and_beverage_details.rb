# frozen_string_literal: true

module Square
  module Types
    # The food and beverage-specific details of a `FOOD_AND_BEV` item.
    class CatalogItemFoodAndBeverageDetails < Internal::Types::Model
      field :calorie_count, Integer, optional: true, nullable: false
      field :dietary_preferences, Internal::Types::Array[Square::Types::CatalogItemFoodAndBeverageDetailsDietaryPreference], optional: true, nullable: false
      field :ingredients, Internal::Types::Array[Square::Types::CatalogItemFoodAndBeverageDetailsIngredient], optional: true, nullable: false

    end
  end
end
