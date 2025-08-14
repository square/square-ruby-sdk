
module Square
  class LocationCapability
    includes Square::Internal::Types::Enum
    CREDIT_CARD_PROCESSING = "CREDIT_CARD_PROCESSING"
    AUTOMATIC_TRANSFERS = "AUTOMATIC_TRANSFERS"
    UNLINKED_REFUNDS = "UNLINKED_REFUNDS"
  end
end
