
module Square
  class V1TenderEntryMethod
    include Square::Internal::Types::Enum
    MANUAL = "MANUAL"
    SCANNED = "SCANNED"
    SQUARE_CASH = "SQUARE_CASH"
    SQUARE_WALLET = "SQUARE_WALLET"
    SWIPED = "SWIPED"
    WEB_FORM = "WEB_FORM"
    OTHER = "OTHER"
  end
end
