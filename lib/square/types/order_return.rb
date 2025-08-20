# frozen_string_literal: true

module Square
  module Types
    # The set of line items, service charges, taxes, discounts, tips, and other items being returned in an order.
    class OrderReturn < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :source_order_id, -> { String }, optional: true, nullable: false
      field :return_line_items, lambda {
        Internal::Types::Array[Square::Types::OrderReturnLineItem]
      }, optional: true, nullable: false
      field :return_service_charges, lambda {
        Internal::Types::Array[Square::Types::OrderReturnServiceCharge]
      }, optional: true, nullable: false
      field :return_taxes, -> { Internal::Types::Array[Square::Types::OrderReturnTax] }, optional: true, nullable: false
      field :return_discounts, lambda {
        Internal::Types::Array[Square::Types::OrderReturnDiscount]
      }, optional: true, nullable: false
      field :return_tips, -> { Internal::Types::Array[Square::Types::OrderReturnTip] }, optional: true, nullable: false
      field :rounding_adjustment, -> { Square::Types::OrderRoundingAdjustment }, optional: true, nullable: false
      field :return_amounts, -> { Square::Types::OrderMoneyAmounts }, optional: true, nullable: false
    end
  end
end
