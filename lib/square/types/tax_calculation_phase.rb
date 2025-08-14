
module Square
  class TaxCalculationPhase
    include Square::Internal::Types::Enum
    TAX_SUBTOTAL_PHASE = "TAX_SUBTOTAL_PHASE"
    TAX_TOTAL_PHASE = "TAX_TOTAL_PHASE"
  end
end
