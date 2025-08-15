
module Square
  class RiskEvaluationRiskLevel
    include Square::Internal::Types::Enum
    PENDING = "PENDING"
    NORMAL = "NORMAL"
    MODERATE = "MODERATE"
    HIGH = "HIGH"
  end
end
