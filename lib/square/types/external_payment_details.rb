# frozen_string_literal: true

module Square
    module Types
        # Stores details about an external payment. Contains only non-confidential information.
        # For more information, see 
        # [Take External Payments](https://developer.squareup.com/docs/payments-api/take-payments/external-payments).
        class ExternalPaymentDetails < Square::Internal::Types::Model
            field :type, String, optional: false, nullable: false
            field :source, String, optional: false, nullable: false
            field :source_id, String, optional: true, nullable: false
            field :source_fee_money, Square::Money, optional: true, nullable: false
        end
    end
end
