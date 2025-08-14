# frozen_string_literal: true

module Square
    module Types
        class PaymentBalanceActivityTaxOnFeeDetail < Internal::Types::Model
            field :payment_id, String, optional: true, nullable: false
            field :tax_rate_description, String, optional: true, nullable: false
        end
    end
end
