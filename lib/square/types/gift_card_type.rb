
module Square
  class GiftCardType
    includes Square::Internal::Types::Enum
    PHYSICAL = "PHYSICAL"
    DIGITAL = "DIGITAL"
  end
end
