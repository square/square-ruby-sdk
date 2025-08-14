# frozen_string_literal: true

module Square
    module Types
        # Contains all information related to a single order to process with Square,
        # including line items that specify the products to purchase. `Order` objects also
        # include information about any associated tenders, refunds, and returns.
        # 
        # All Connect V2 Transactions have all been converted to Orders including all associated
        # itemization data.
        class Order < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :location_id, String, optional: false, nullable: false
            field :reference_id, String, optional: true, nullable: false
            field :source, Square::OrderSource, optional: true, nullable: false
            field :customer_id, String, optional: true, nullable: false
            field :line_items, Square::Internal::Types::Array[Square::OrderLineItem], optional: true, nullable: false
            field :taxes, Square::Internal::Types::Array[Square::OrderLineItemTax], optional: true, nullable: false
            field :discounts, Square::Internal::Types::Array[Square::OrderLineItemDiscount], optional: true, nullable: false
            field :service_charges, Square::Internal::Types::Array[Square::OrderServiceCharge], optional: true, nullable: false
            field :fulfillments, Square::Internal::Types::Array[Square::Fulfillment], optional: true, nullable: false
            field :returns, Square::Internal::Types::Array[Square::OrderReturn], optional: true, nullable: false
            field :return_amounts, Square::OrderMoneyAmounts, optional: true, nullable: false
            field :net_amounts, Square::OrderMoneyAmounts, optional: true, nullable: false
            field :rounding_adjustment, Square::OrderRoundingAdjustment, optional: true, nullable: false
            field :tenders, Square::Internal::Types::Array[Square::Tender], optional: true, nullable: false
            field :refunds, Square::Internal::Types::Array[Square::Refund], optional: true, nullable: false
            field :metadata, Square::Internal::Types::Hash[String, String], optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :closed_at, String, optional: true, nullable: false
            field :state, Square::OrderState, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :total_money, Square::Money, optional: true, nullable: false
            field :total_tax_money, Square::Money, optional: true, nullable: false
            field :total_discount_money, Square::Money, optional: true, nullable: false
            field :total_tip_money, Square::Money, optional: true, nullable: false
            field :total_service_charge_money, Square::Money, optional: true, nullable: false
            field :ticket_name, String, optional: true, nullable: false
            field :pricing_options, Square::OrderPricingOptions, optional: true, nullable: false
            field :rewards, Square::Internal::Types::Array[Square::OrderReward], optional: true, nullable: false
            field :net_amount_due_money, Square::Money, optional: true, nullable: false
        end
    end
end
