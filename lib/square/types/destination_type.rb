
module Square
  class DestinationType
    include Square::Internal::Types::Enum
    BANK_ACCOUNT = "BANK_ACCOUNT"
    CARD = "CARD"
    SQUARE_BALANCE = "SQUARE_BALANCE"
    SQUARE_STORED_BALANCE = "SQUARE_STORED_BALANCE"
  end
end
