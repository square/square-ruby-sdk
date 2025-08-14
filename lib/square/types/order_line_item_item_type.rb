
module Square
  class OrderLineItemItemType
    include Square::Internal::Types::Enum
    ITEM = "ITEM"
    CUSTOM_AMOUNT = "CUSTOM_AMOUNT"
    GIFT_CARD = "GIFT_CARD"
  end
end
