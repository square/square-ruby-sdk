# frozen_string_literal: true

module Square
    module Types
        class PaymentBalanceActivityDisputeDetail < Square::Internal::Types::Model
            field :payment_id, String, optional: true, nullable: false
            field :dispute_id, String, optional: true, nullable: false
        end
    end
end
