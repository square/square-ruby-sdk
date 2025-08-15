
module Square
  class TransactionProduct
    include Square::Internal::Types::Enum
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
