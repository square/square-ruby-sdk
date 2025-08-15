# frozen_string_literal: true

module Square
  # The set of line items, service charges, taxes, discounts, tips, and other items being returned in an order.
  class OrderReturn < Internal::Types::Model
    field :uid, String, optional: true, nullable: false
    field :source_order_id, String, optional: true, nullable: false
    field :return_line_items, Internal::Types::Array[Square::OrderReturnLineItem], optional: true, nullable: false
    field :return_service_charges, Internal::Types::Array[Square::OrderReturnServiceCharge], optional: true, nullable: false
    field :return_taxes, Internal::Types::Array[Square::OrderReturnTax], optional: true, nullable: false
    field :return_discounts, Internal::Types::Array[Square::OrderReturnDiscount], optional: true, nullable: false
    field :return_tips, Internal::Types::Array[Square::OrderReturnTip], optional: true, nullable: false
    field :rounding_adjustment, Square::OrderRoundingAdjustment, optional: true, nullable: false
    field :return_amounts, Square::OrderMoneyAmounts, optional: true, nullable: false

  end
end
