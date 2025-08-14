
module Square
  class InvoiceRequestType
    includes Square::Internal::Types::Enum
    BALANCE = "BALANCE"
    DEPOSIT = "DEPOSIT"
    INSTALLMENT = "INSTALLMENT"
  end
end
