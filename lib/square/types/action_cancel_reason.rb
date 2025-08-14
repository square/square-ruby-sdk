
module Square
  class ActionCancelReason
    include Square::Internal::Types::Enum
    BUYER_CANCELED = "BUYER_CANCELED"
    SELLER_CANCELED = "SELLER_CANCELED"
    TIMED_OUT = "TIMED_OUT"
  end
end
