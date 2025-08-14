
module Square
    module Types
        class TransactionType < Square::Internal::Types::Enum
            DEBIT = "DEBIT"
            CREDIT = "CREDIT"
        end
    end
end
