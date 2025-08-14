
module Square
  class LoyaltyRewardStatus
    include Square::Internal::Types::Enum
    ISSUED = "ISSUED"
    REDEEMED = "REDEEMED"
    DELETED = "DELETED"
  end
end
