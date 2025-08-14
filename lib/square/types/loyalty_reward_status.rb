
module Square
  class LoyaltyRewardStatus
    includes Square::Internal::Types::Enum
    ISSUED = "ISSUED"
    REDEEMED = "REDEEMED"
    DELETED = "DELETED"
  end
end
