
module Square
    module Types
        class InvoiceRequestType < Square::Internal::Types::Enum
            BALANCE = "BALANCE"
            DEPOSIT = "DEPOSIT"
            INSTALLMENT = "INSTALLMENT"
        end
    end
end
