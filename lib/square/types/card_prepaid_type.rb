
module Square
  class CardPrepaidType
    includes Square::Internal::Types::Enum
    UNKNOWN_PREPAID_TYPE = "UNKNOWN_PREPAID_TYPE"
    NOT_PREPAID = "NOT_PREPAID"
    PREPAID = "PREPAID"
  end
end
