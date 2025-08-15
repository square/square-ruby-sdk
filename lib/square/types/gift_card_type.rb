
module Square
  class GiftCardType
    include Square::Internal::Types::Enum
    PHYSICAL = "PHYSICAL"
    DIGITAL = "DIGITAL"
  end
end
