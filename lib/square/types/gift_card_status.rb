
module Square
  class GiftCardStatus
    includes Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    DEACTIVATED = "DEACTIVATED"
    BLOCKED = "BLOCKED"
    PENDING = "PENDING"
  end
end
