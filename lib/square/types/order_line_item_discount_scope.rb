# frozen_string_literal: true

module Square
  module Types
    module OrderLineItemDiscountScope
      extend Square::Internal::Types::Enum

      OTHER_DISCOUNT_SCOPE = "OTHER_DISCOUNT_SCOPE"
      LINE_ITEM = "LINE_ITEM"
      ORDER = "ORDER"
    end
  end
end
