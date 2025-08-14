
module Square
  class TenderSquareAccountDetailsStatus
    includes Square::Internal::Types::Enum
    AUTHORIZED = "AUTHORIZED"
    CAPTURED = "CAPTURED"
    VOIDED = "VOIDED"
    FAILED = "FAILED"
  end
end
