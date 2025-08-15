
module Square
  class TenderCardDetailsStatus
    include Square::Internal::Types::Enum
    AUTHORIZED = "AUTHORIZED"
    CAPTURED = "CAPTURED"
    VOIDED = "VOIDED"
    FAILED = "FAILED"
  end
end
