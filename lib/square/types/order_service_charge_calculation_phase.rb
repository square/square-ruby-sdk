
module Square
    module Types
        class OrderServiceChargeCalculationPhase < Square::Internal::Types::Enum
            SUBTOTAL_PHASE = "SUBTOTAL_PHASE"
            TOTAL_PHASE = "TOTAL_PHASE"
            APPORTIONED_PERCENTAGE_PHASE = "APPORTIONED_PERCENTAGE_PHASE"
            APPORTIONED_AMOUNT_PHASE = "APPORTIONED_AMOUNT_PHASE"
        end
    end
end
