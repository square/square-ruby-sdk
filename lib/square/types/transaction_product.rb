# frozen_string_literal: true

module SquareApiClient
# Indicates the Square product used to process a transaction.
  class TransactionProduct

    REGISTER = "REGISTER"
    EXTERNAL_API = "EXTERNAL_API"
    BILLING = "BILLING"
    APPOINTMENTS = "APPOINTMENTS"
    INVOICES = "INVOICES"
    ONLINE_STORE = "ONLINE_STORE"
    PAYROLL = "PAYROLL"
    OTHER = "OTHER"

  end
end