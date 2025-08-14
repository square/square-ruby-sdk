
module Square
    module Types
        class DestinationType < Square::Internal::Types::Enum
            BANK_ACCOUNT = "BANK_ACCOUNT"
            CARD = "CARD"
            SQUARE_BALANCE = "SQUARE_BALANCE"
            SQUARE_STORED_BALANCE = "SQUARE_STORED_BALANCE"
        end
    end
end
