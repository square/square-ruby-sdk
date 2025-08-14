# frozen_string_literal: true

module Square
    module Types
        # Dietary preferences that can be assigned to an `FOOD_AND_BEV` item and its ingredients.
        class CatalogItemFoodAndBeverageDetailsDietaryPreference < Internal::Types::Model
            field :type, Square::CatalogItemFoodAndBeverageDetailsDietaryPreferenceType, optional: true, nullable: false
            field :standard_name, Square::CatalogItemFoodAndBeverageDetailsDietaryPreferenceStandardDietaryPreference, optional: true, nullable: false
            field :custom_name, String, optional: true, nullable: false
        end
    end
end
