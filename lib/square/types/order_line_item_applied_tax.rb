# frozen_string_literal: true

module Square
  module Types
    # Represents an applied portion of a tax to a line item in an order.
    # 
    # Order-scoped taxes automatically include the applied taxes in each line item.
    # Line item taxes must be referenced from any applicable line items.
    # The corresponding applied money is automatically computed, based on the
    # set of participating line items.
    class OrderLineItemAppliedTax < Internal::Types::Model
      field :uid, String, optional: true, nullable: false
      field :tax_uid, String, optional: false, nullable: false
      field :applied_money, Square::Types::Money, optional: true, nullable: false

    end
  end
end
