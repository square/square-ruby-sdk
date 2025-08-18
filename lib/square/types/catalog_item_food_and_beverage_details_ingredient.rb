# frozen_string_literal: true

module Square
  module Types
    # Describes the ingredient used in a `FOOD_AND_BEV` item.
    class CatalogItemFoodAndBeverageDetailsIngredient < Internal::Types::Model
      field :type, Square::Types::CatalogItemFoodAndBeverageDetailsDietaryPreferenceType, optional: true, nullable: false
      field :standard_name, Square::Types::CatalogItemFoodAndBeverageDetailsIngredientStandardIngredient, optional: true, nullable: false
      field :custom_name, String, optional: true, nullable: false

    end
  end
end
