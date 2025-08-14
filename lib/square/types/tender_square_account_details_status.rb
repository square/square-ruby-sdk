
module Square
  class TenderSquareAccountDetailsStatus
    include Square::Internal::Types::Enum
    AUTHORIZED = "AUTHORIZED"
    CAPTURED = "CAPTURED"
    VOIDED = "VOIDED"
    FAILED = "FAILED"
  end
end
