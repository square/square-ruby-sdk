# frozen_string_literal: true

module Square
  module Types
    # Represents an applied portion of a discount to a line item in an order.
    # 
    # Order scoped discounts have automatically applied discounts present for each line item.
    # Line-item scoped discounts must have applied discounts added manually for any applicable line
    # items. The corresponding applied money is automatically computed based on participating
    # line items.
    class OrderLineItemAppliedDiscount < Internal::Types::Model
      field :uid, String, optional: true, nullable: false
      field :discount_uid, String, optional: false, nullable: false
      field :applied_money, Square::Money, optional: true, nullable: false

    end
  end
end
