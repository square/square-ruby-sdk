
module Square
  class TransactionType
    include Square::Internal::Types::Enum
    DEBIT = "DEBIT"
    CREDIT = "CREDIT"
  end
end
