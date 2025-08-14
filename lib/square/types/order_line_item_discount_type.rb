
module Square
    module Types
        class OrderLineItemDiscountType
            extends Square::Internal::Types::Enum
            UNKNOWN_DISCOUNT = "UNKNOWN_DISCOUNT"
            FIXED_PERCENTAGE = "FIXED_PERCENTAGE"
            FIXED_AMOUNT = "FIXED_AMOUNT"
            VARIABLE_PERCENTAGE = "VARIABLE_PERCENTAGE"
            VARIABLE_AMOUNT = "VARIABLE_AMOUNT"
        end
    end
end
