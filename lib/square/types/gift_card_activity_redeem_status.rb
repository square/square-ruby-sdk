
module Square
  class GiftCardActivityRedeemStatus
    include Square::Internal::Types::Enum
    PENDING = "PENDING"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"
  end
end
