
module Square
  class LoyaltyProgramAccrualRuleTaxMode
    include Square::Internal::Types::Enum
    BEFORE_TAX = "BEFORE_TAX"
    AFTER_TAX = "AFTER_TAX"
  end
end
