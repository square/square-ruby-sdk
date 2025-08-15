
module Square
  class LoyaltyPromotionStatus
    include Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    ENDED = "ENDED"
    CANCELED = "CANCELED"
    SCHEDULED = "SCHEDULED"
  end
end
