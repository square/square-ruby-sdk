
module Square
  class TenderBankAccountDetailsStatus
    includes Square::Internal::Types::Enum
    PENDING = "PENDING"
    COMPLETED = "COMPLETED"
    FAILED = "FAILED"
  end
end
