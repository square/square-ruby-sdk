
module Square
  class PaymentOptionsDelayAction
    include Square::Internal::Types::Enum
    CANCEL = "CANCEL"
    COMPLETE = "COMPLETE"
  end
end
