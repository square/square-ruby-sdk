
module Square
    module Types
        class CardType < Square::Internal::Types::Enum
            UNKNOWN_CARD_TYPE = "UNKNOWN_CARD_TYPE"
            CREDIT = "CREDIT"
            DEBIT = "DEBIT"
        end
    end
end
