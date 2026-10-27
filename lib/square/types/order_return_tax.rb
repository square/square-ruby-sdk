# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a tax being returned that applies to one or more return line items in an order.
    #
    # Fixed-amount, order-scoped taxes are distributed across all non-zero return line item totals.
    # The amount distributed to each return line item is relative to that item’s contribution to the
    # order subtotal.
    class OrderReturnTax < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :source_tax_uid, -> { String }, optional: true, nullable: true

      field :catalog_object_id, -> { String }, optional: true, nullable: true

      field :catalog_version, -> { Integer }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :type, -> { Square::Types::OrderLineItemTaxType }, optional: true, nullable: false

      field :percentage, -> { String }, optional: true, nullable: true

      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :scope, -> { Square::Types::OrderLineItemTaxScope }, optional: true, nullable: false
    end
  end
end
