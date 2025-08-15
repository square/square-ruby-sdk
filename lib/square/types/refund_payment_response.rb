# frozen_string_literal: true

module Square
  # Defines the response returned by
  # [RefundPayment](api-endpoint:Refunds-RefundPayment).
  # 
  # If there are errors processing the request, the `refund` field might not be
  # present, or it might be present with a status of `FAILED`.
  class RefundPaymentResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :refund, Square::PaymentRefund, optional: true, nullable: false

  end
end
