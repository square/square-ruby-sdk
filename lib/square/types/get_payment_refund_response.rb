# frozen_string_literal: true

module Square
    module Types
        # Defines the response returned by [GetRefund](api-endpoint:Refunds-GetPaymentRefund).
        # 
        # Note: If there are errors processing the request, the refund field might not be
        # present or it might be present in a FAILED state.
        class GetPaymentRefundResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :refund, Square::PaymentRefund, optional: true, nullable: false
        end
    end
end
