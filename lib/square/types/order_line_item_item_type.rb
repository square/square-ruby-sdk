# frozen_string_literal: true

module Square
  module Types
    module OrderLineItemItemType
      extend Square::Internal::Types::Enum

      ITEM = "ITEM"
      CUSTOM_AMOUNT = "CUSTOM_AMOUNT"
      GIFT_CARD = "GIFT_CARD"
    end
  end
end
