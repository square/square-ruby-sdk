# frozen_string_literal: true

module Square
  class PaymentBalanceActivityThirdPartyFeeRefundDetail < Internal::Types::Model
    field :payment_id, String, optional: true, nullable: false
    field :refund_id, String, optional: true, nullable: false

  end
end
