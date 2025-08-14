
module Square
  class LoyaltyPromotionStatus
    includes Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    ENDED = "ENDED"
    CANCELED = "CANCELED"
    SCHEDULED = "SCHEDULED"
  end
end
