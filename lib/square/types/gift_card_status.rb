
module Square
  class GiftCardStatus
    include Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    DEACTIVATED = "DEACTIVATED"
    BLOCKED = "BLOCKED"
    PENDING = "PENDING"
  end
end
