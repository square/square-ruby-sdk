
module Square
    module Types
        class OrderLineItemTaxType < Square::Internal::Types::Enum
            UNKNOWN_TAX = "UNKNOWN_TAX"
            ADDITIVE = "ADDITIVE"
            INCLUSIVE = "INCLUSIVE"
        end
    end
end
