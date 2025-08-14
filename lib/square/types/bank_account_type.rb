
module Square
    module Types
        class BankAccountType
            extends Square::Internal::Types::Enum
            CHECKING = "CHECKING"
            SAVINGS = "SAVINGS"
            INVESTMENT = "INVESTMENT"
            OTHER = "OTHER"
            BUSINESS_CHECKING = "BUSINESS_CHECKING"
        end
    end
end
