
module Square
  class V1UpdateOrderRequestAction
    include Square::Internal::Types::Enum
    COMPLETE = "COMPLETE"
    CANCEL = "CANCEL"
    REFUND = "REFUND"
  end
end
