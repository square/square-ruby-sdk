# frozen_string_literal: true

module Square
    module Types
        # The payment the cardholder disputed.
        class DisputedPayment < Internal::Types::Model
            field :payment_id, String, optional: true, nullable: false
        end
    end
end
