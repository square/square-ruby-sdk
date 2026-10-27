# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class PaymentBalanceActivityDepositFeeDetail < Internal::Types::Model
      field :payout_id, -> { String }, optional: true, nullable: true
    end
  end
end
