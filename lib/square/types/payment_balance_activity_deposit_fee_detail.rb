# frozen_string_literal: true

module Square
  module Types
    class PaymentBalanceActivityDepositFeeDetail < Internal::Types::Model
      field :payout_id, -> { String }, optional: true, nullable: false
    end
  end
end
