# frozen_string_literal: true

module square.rb
# Specifies the action for Square to take for processing the invoice. For example,
#  email the invoice, charge a customer's card on file, or do nothing. DEPRECATED
#  at
#  version 2021-01-21. The corresponding `request_method` field is replaced by the
#  `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source`
#  fields.
  class InvoiceRequestMethod

    EMAIL = "EMAIL"
    CHARGE_CARD_ON_FILE = "CHARGE_CARD_ON_FILE"
    SHARE_MANUALLY = "SHARE_MANUALLY"
    CHARGE_BANK_ON_FILE = "CHARGE_BANK_ON_FILE"
    SMS = "SMS"
    SMS_CHARGE_CARD_ON_FILE = "SMS_CHARGE_CARD_ON_FILE"
    SMS_CHARGE_BANK_ON_FILE = "SMS_CHARGE_BANK_ON_FILE"

  end
end