
module Square
  class InvoiceAutomaticPaymentSource
    include Square::Internal::Types::Enum
    NONE = "NONE"
    CARD_ON_FILE = "CARD_ON_FILE"
    BANK_ON_FILE = "BANK_ON_FILE"
  end
end
