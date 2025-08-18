# frozen_string_literal: true

module Square
  module Types
    # Stores details about a cash payment. Contains only non-confidential information. For more information, see 
    # [Take Cash Payments](https://developer.squareup.com/docs/payments-api/take-payments/cash-payments).
    class CashPaymentDetails < Internal::Types::Model
      field :buyer_supplied_money, Square::Types::Money, optional: false, nullable: false
      field :change_back_money, Square::Types::Money, optional: true, nullable: false

    end
  end
end
