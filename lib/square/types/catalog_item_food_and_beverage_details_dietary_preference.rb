# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Dietary preferences that can be assigned to an `FOOD_AND_BEV` item and its ingredients.
    class CatalogItemFoodAndBeverageDetailsDietaryPreference < Internal::Types::Model
      field :type, -> { Square::Types::CatalogItemFoodAndBeverageDetailsDietaryPreferenceType }, optional: true, nullable: false

      field :standard_name, -> { Square::Types::CatalogItemFoodAndBeverageDetailsDietaryPreferenceStandardDietaryPreference }, optional: true, nullable: false

      field :custom_name, -> { String }, optional: true, nullable: true
    end
  end
end
