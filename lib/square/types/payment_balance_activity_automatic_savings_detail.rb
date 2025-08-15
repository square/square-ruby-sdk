# frozen_string_literal: true

module Square
  class PaymentBalanceActivityAutomaticSavingsDetail < Internal::Types::Model
    field :payment_id, String, optional: true, nullable: false
    field :payout_id, String, optional: true, nullable: false

  end
end
