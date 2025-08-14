
module Square
  class OrderLineItemTaxType
    include Square::Internal::Types::Enum
    UNKNOWN_TAX = "UNKNOWN_TAX"
    ADDITIVE = "ADDITIVE"
    INCLUSIVE = "INCLUSIVE"
  end
end
