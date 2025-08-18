# frozen_string_literal: true

module Square
  module Types
    module OrderServiceChargeCalculationPhase
      extend Square::Internal::Types::Enum
      SUBTOTAL_PHASE = "SUBTOTAL_PHASE"
      TOTAL_PHASE = "TOTAL_PHASE"
      APPORTIONED_PERCENTAGE_PHASE = "APPORTIONED_PERCENTAGE_PHASE"
      APPORTIONED_AMOUNT_PHASE = "APPORTIONED_AMOUNT_PHASE"end
  end
end
