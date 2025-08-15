# frozen_string_literal: true

module Square
  # Defines the response returned by [CreatePayment](api-endpoint:Payments-CreatePayment).
  # 
  # If there are errors processing the request, the `payment` field might not be
  # present, or it might be present with a status of `FAILED`.
  class CreatePaymentResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :payment, Square::Payment, optional: true, nullable: false

  end
end
