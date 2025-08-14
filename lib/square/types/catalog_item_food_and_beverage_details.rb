# frozen_string_literal: true

module Square
    module Types
        # The food and beverage-specific details of a `FOOD_AND_BEV` item.
        class CatalogItemFoodAndBeverageDetails < Square::Internal::Types::Model
            field :calorie_count, Integer, optional: true, nullable: false
            field :dietary_preferences, Square::Internal::Types::Array[Square::CatalogItemFoodAndBeverageDetailsDietaryPreference], optional: true, nullable: false
            field :ingredients, Square::Internal::Types::Array[Square::CatalogItemFoodAndBeverageDetailsIngredient], optional: true, nullable: false
        end
    end
end
