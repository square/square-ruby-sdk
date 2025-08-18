# frozen_string_literal: true

module Square
  module Types
    # Represents a tax that applies to one or more line item in the order.
    # 
    # Fixed-amount, order-scoped taxes are distributed across all non-zero line item totals.
    # The amount distributed to each line item is relative to the amount the item
    # contributes to the order subtotal.
    class OrderLineItemTax < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :catalog_object_id, -> { String }, optional: true, nullable: false
      field :catalog_version, -> { Integer }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { Square::Types::OrderLineItemTaxType }, optional: true, nullable: false
      field :percentage, -> { String }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :scope, -> { Square::Types::OrderLineItemTaxScope }, optional: true, nullable: false
      field :auto_applied, -> { Internal::Types::Boolean }, optional: true, nullable: false

    end
  end
end
