# frozen_string_literal: true

module Square
    module Types
        class PaymentBalanceActivityThirdPartyFeeRefundDetail < Square::Internal::Types::Model
            field :payment_id, String, optional: true, nullable: false
            field :refund_id, String, optional: true, nullable: false
        end
    end
end
