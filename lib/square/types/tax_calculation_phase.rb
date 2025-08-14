
module Square
  class TaxCalculationPhase
    includes Square::Internal::Types::Enum
    TAX_SUBTOTAL_PHASE = "TAX_SUBTOTAL_PHASE"
    TAX_TOTAL_PHASE = "TAX_TOTAL_PHASE"
  end
end
