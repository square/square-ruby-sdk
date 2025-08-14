
module Square
  class InvoiceDeliveryMethod
    includes Square::Internal::Types::Enum
    EMAIL = "EMAIL"
    SHARE_MANUALLY = "SHARE_MANUALLY"
    SMS = "SMS"
  end
end
