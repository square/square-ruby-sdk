
module Square
  class RiskEvaluationRiskLevel
    includes Square::Internal::Types::Enum
    PENDING = "PENDING"
    NORMAL = "NORMAL"
    MODERATE = "MODERATE"
    HIGH = "HIGH"
  end
end
