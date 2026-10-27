# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CatalogItemFoodAndBeverageDetailsDietaryPreferenceType
      extend Square::Internal::Types::Enum

      STANDARD = "STANDARD"
      CUSTOM = "CUSTOM"
    end
  end
end
