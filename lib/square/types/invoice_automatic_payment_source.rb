# frozen_string_literal: true

module Square
  module Types
    module InvoiceAutomaticPaymentSource
      extends Square::Internal::Types::Enum
      NONE = "NONE"
      CARD_ON_FILE = "CARD_ON_FILE"
      BANK_ON_FILE = "BANK_ON_FILE"end
  end
end
