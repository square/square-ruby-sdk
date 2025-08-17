# frozen_string_literal: true

module Square
  module Types
    module RiskEvaluationRiskLevel
      extends Square::Internal::Types::Enum
      PENDING = "PENDING"
      NORMAL = "NORMAL"
      MODERATE = "MODERATE"
      HIGH = "HIGH"end
  end
end
