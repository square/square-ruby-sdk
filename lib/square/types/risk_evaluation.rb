# frozen_string_literal: true

module Square
  # Represents fraud risk information for the associated payment.
  # 
  # When you take a payment through Square's Payments API (using the `CreatePayment`
  # endpoint), Square evaluates it and assigns a risk level to the payment. Sellers
  # can use this information to determine the course of action (for example,
  # provide the goods/services or refund the payment).
  class RiskEvaluation < Internal::Types::Model
    field :created_at, String, optional: true, nullable: false
    field :risk_level, Square::RiskEvaluationRiskLevel, optional: true, nullable: false

  end
end
