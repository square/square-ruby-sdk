
module Square
  class LoyaltyProgramAccrualRuleType
    includes Square::Internal::Types::Enum
    VISIT = "VISIT"
    SPEND = "SPEND"
    ITEM_VARIATION = "ITEM_VARIATION"
    CATEGORY = "CATEGORY"
  end
end
