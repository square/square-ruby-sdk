
module Square
  class OrderLineItemDiscountScope
    include Square::Internal::Types::Enum
    OTHER_DISCOUNT_SCOPE = "OTHER_DISCOUNT_SCOPE"
    LINE_ITEM = "LINE_ITEM"
    ORDER = "ORDER"
  end
end
