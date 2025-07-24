# frozen_string_literal: true

module SquareApiClient
# Indicates how the discount is applied to the associated line item or order.
  class OrderLineItemDiscountType

    UNKNOWN_DISCOUNT = "UNKNOWN_DISCOUNT"
    FIXED_PERCENTAGE = "FIXED_PERCENTAGE"
    FIXED_AMOUNT = "FIXED_AMOUNT"
    VARIABLE_PERCENTAGE = "VARIABLE_PERCENTAGE"
    VARIABLE_AMOUNT = "VARIABLE_AMOUNT"

  end
end