
module Square
  class TenderBankAccountDetailsStatus
    include Square::Internal::Types::Enum
    PENDING = "PENDING"
    COMPLETED = "COMPLETED"
    FAILED = "FAILED"
  end
end
