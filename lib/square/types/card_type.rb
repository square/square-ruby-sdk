
module Square
  class CardType
    includes Square::Internal::Types::Enum
    UNKNOWN_CARD_TYPE = "UNKNOWN_CARD_TYPE"
    CREDIT = "CREDIT"
    DEBIT = "DEBIT"
  end
end
