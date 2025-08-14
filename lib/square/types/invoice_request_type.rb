
module Square
  class InvoiceRequestType
    include Square::Internal::Types::Enum
    BALANCE = "BALANCE"
    DEPOSIT = "DEPOSIT"
    INSTALLMENT = "INSTALLMENT"
  end
end
