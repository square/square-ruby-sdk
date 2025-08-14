
module Square
  class PaymentOptionsDelayAction
    includes Square::Internal::Types::Enum
    CANCEL = "CANCEL"
    COMPLETE = "COMPLETE"
  end
end
