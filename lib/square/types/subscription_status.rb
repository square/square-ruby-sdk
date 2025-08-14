
module Square
  class SubscriptionStatus
    include Square::Internal::Types::Enum
    PENDING = "PENDING"
    ACTIVE = "ACTIVE"
    CANCELED = "CANCELED"
    DEACTIVATED = "DEACTIVATED"
    PAUSED = "PAUSED"
  end
end
