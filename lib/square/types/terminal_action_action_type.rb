
module Square
  class TerminalActionActionType
    includes Square::Internal::Types::Enum
    QR_CODE = "QR_CODE"
    PING = "PING"
    SAVE_CARD = "SAVE_CARD"
    SIGNATURE = "SIGNATURE"
    CONFIRMATION = "CONFIRMATION"
    RECEIPT = "RECEIPT"
    DATA_COLLECTION = "DATA_COLLECTION"
    SELECT = "SELECT"
  end
end
