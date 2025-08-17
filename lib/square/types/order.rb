# frozen_string_literal: true

module Square
  module Types
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    class Order < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :location_id, String, optional: false, nullable: false
      field :reference_id, String, optional: true, nullable: false
      field :source, Square::Types::OrderSource, optional: true, nullable: false
      field :customer_id, String, optional: true, nullable: false
      field :line_items, Internal::Types::Array[Square::Types::OrderLineItem], optional: true, nullable: false
      field :taxes, Internal::Types::Array[Square::Types::OrderLineItemTax], optional: true, nullable: false
      field :discounts, Internal::Types::Array[Square::Types::OrderLineItemDiscount], optional: true, nullable: false
      field :service_charges, Internal::Types::Array[Square::Types::OrderServiceCharge], optional: true, nullable: false
      field :fulfillments, Internal::Types::Array[Square::Types::Fulfillment], optional: true, nullable: false
      field :returns, Internal::Types::Array[Square::Types::OrderReturn], optional: true, nullable: false
      field :return_amounts, Square::Types::OrderMoneyAmounts, optional: true, nullable: false
      field :net_amounts, Square::Types::OrderMoneyAmounts, optional: true, nullable: false
      field :rounding_adjustment, Square::Types::OrderRoundingAdjustment, optional: true, nullable: false
      field :tenders, Internal::Types::Array[Square::Types::Tender], optional: true, nullable: false
      field :refunds, Internal::Types::Array[Square::Types::Refund], optional: true, nullable: false
      field :metadata, Internal::Types::Hash[String, String], optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :closed_at, String, optional: true, nullable: false
      field :state, Square::Types::OrderState, optional: true, nullable: false
      field :version, Integer, optional: true, nullable: false
      field :total_money, Square::Types::Money, optional: true, nullable: false
      field :total_tax_money, Square::Types::Money, optional: true, nullable: false
      field :total_discount_money, Square::Types::Money, optional: true, nullable: false
      field :total_tip_money, Square::Types::Money, optional: true, nullable: false
      field :total_service_charge_money, Square::Types::Money, optional: true, nullable: false
      field :ticket_name, String, optional: true, nullable: false
      field :pricing_options, Square::Types::OrderPricingOptions, optional: true, nullable: false
      field :rewards, Internal::Types::Array[Square::Types::OrderReward], optional: true, nullable: false
      field :net_amount_due_money, Square::Types::Money, optional: true, nullable: false

    end
  end
end
