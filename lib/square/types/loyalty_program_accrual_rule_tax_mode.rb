
module Square
  class LoyaltyProgramAccrualRuleTaxMode
    includes Square::Internal::Types::Enum
    BEFORE_TAX = "BEFORE_TAX"
    AFTER_TAX = "AFTER_TAX"
  end
end
