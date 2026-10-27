# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class PaymentBalanceActivityRefundDetail < Internal::Types::Model
      field :payment_id, -> { String }, optional: true, nullable: true

      field :refund_id, -> { String }, optional: true, nullable: true
    end
  end
end
