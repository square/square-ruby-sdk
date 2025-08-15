# frozen_string_literal: true

module Square
  # Defines the response returned by [CancelPayment](api-endpoint:Payments-CancelPayment).
  class CancelPaymentResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :payment, Square::Payment, optional: true, nullable: false

  end
end
