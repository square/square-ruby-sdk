# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TaxCalculationPhase
      extend Square::Internal::Types::Enum

      TAX_SUBTOTAL_PHASE = "TAX_SUBTOTAL_PHASE"
      TAX_TOTAL_PHASE = "TAX_TOTAL_PHASE"
    end
  end
end
