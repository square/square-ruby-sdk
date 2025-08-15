
module Square
  class CatalogPricingType
    include Square::Internal::Types::Enum
    FIXED_PRICING = "FIXED_PRICING"
    VARIABLE_PRICING = "VARIABLE_PRICING"
  end
end
