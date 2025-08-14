
module Square
  class BankAccountType
    include Square::Internal::Types::Enum
    CHECKING = "CHECKING"
    SAVINGS = "SAVINGS"
    INVESTMENT = "INVESTMENT"
    OTHER = "OTHER"
    BUSINESS_CHECKING = "BUSINESS_CHECKING"
  end
end
