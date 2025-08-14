# frozen_string_literal: true

module Square
    module Types
        class PaymentBalanceActivityAutomaticSavingsReversedDetail < Square::Internal::Types::Model
            field :payment_id, String, optional: true, nullable: false
            field :payout_id, String, optional: true, nullable: false
        end
    end
end
