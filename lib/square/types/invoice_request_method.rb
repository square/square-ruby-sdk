# frozen_string_literal: true

module Square
  module Types
    module InvoiceRequestMethod
      extend Square::Internal::Types::Enum

      EMAIL = "EMAIL"
      CHARGE_CARD_ON_FILE = "CHARGE_CARD_ON_FILE"
      SHARE_MANUALLY = "SHARE_MANUALLY"
      CHARGE_BANK_ON_FILE = "CHARGE_BANK_ON_FILE"
      SMS = "SMS"
      SMS_CHARGE_CARD_ON_FILE = "SMS_CHARGE_CARD_ON_FILE"
      SMS_CHARGE_BANK_ON_FILE = "SMS_CHARGE_BANK_ON_FILE"end
  end
end
