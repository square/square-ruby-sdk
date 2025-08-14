
module Square
  class TransactionType
    includes Square::Internal::Types::Enum
    DEBIT = "DEBIT"
    CREDIT = "CREDIT"
  end
end
