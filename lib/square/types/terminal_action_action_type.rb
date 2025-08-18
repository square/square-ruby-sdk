# frozen_string_literal: true

module Square
  module Types
    module TerminalActionActionType
      extend Square::Internal::Types::Enum
      QR_CODE = "QR_CODE"
      PING = "PING"
      SAVE_CARD = "SAVE_CARD"
      SIGNATURE = "SIGNATURE"
      CONFIRMATION = "CONFIRMATION"
      RECEIPT = "RECEIPT"
      DATA_COLLECTION = "DATA_COLLECTION"
      SELECT = "SELECT"end
  end
end
