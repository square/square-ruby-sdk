# frozen_string_literal: true

module Square
    module Types
        # Defines the response returned by
        # [UpdatePayment](api-endpoint:Payments-UpdatePayment).
        class UpdatePaymentResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :payment, Square::Payment, optional: true, nullable: false
        end
    end
end
