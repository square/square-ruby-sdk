
module Square
    module Types
        class TenderType
            extends Square::Internal::Types::Enum
            CARD = "CARD"
            CASH = "CASH"
            THIRD_PARTY_CARD = "THIRD_PARTY_CARD"
            SQUARE_GIFT_CARD = "SQUARE_GIFT_CARD"
            NO_SALE = "NO_SALE"
            BANK_ACCOUNT = "BANK_ACCOUNT"
            WALLET = "WALLET"
            BUY_NOW_PAY_LATER = "BUY_NOW_PAY_LATER"
            SQUARE_ACCOUNT = "SQUARE_ACCOUNT"
            OTHER = "OTHER"
        end
    end
end
