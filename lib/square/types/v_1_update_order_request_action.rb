
module Square
  class V1UpdateOrderRequestAction
    includes Square::Internal::Types::Enum
    COMPLETE = "COMPLETE"
    CANCEL = "CANCEL"
    REFUND = "REFUND"
  end
end
