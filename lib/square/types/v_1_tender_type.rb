
module Square
    module Types
        class V1TenderType < Square::Internal::Types::Enum
            CREDIT_CARD = "CREDIT_CARD"
            CASH = "CASH"
            THIRD_PARTY_CARD = "THIRD_PARTY_CARD"
            NO_SALE = "NO_SALE"
            SQUARE_WALLET = "SQUARE_WALLET"
            SQUARE_GIFT_CARD = "SQUARE_GIFT_CARD"
            UNKNOWN = "UNKNOWN"
            OTHER = "OTHER"
        end
    end
end
