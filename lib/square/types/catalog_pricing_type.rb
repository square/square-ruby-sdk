# frozen_string_literal: true

module Square
  module Types
    module CatalogPricingType
      extend Square::Internal::Types::Enum

      FIXED_PRICING = "FIXED_PRICING"
      VARIABLE_PRICING = "VARIABLE_PRICING"
    end
  end
end
