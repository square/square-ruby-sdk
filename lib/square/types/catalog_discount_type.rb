
module Square
    module Types
        class CatalogDiscountType < Square::Internal::Types::Enum
            FIXED_PERCENTAGE = "FIXED_PERCENTAGE"
            FIXED_AMOUNT = "FIXED_AMOUNT"
            VARIABLE_PERCENTAGE = "VARIABLE_PERCENTAGE"
            VARIABLE_AMOUNT = "VARIABLE_AMOUNT"
        end
    end
end
