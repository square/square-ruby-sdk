
module Square
  class CatalogPricingType
    includes Square::Internal::Types::Enum
    FIXED_PRICING = "FIXED_PRICING"
    VARIABLE_PRICING = "VARIABLE_PRICING"
  end
end
