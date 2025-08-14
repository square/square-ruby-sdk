
module Square
  class GiftCardActivityRedeemStatus
    includes Square::Internal::Types::Enum
    PENDING = "PENDING"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"
  end
end
