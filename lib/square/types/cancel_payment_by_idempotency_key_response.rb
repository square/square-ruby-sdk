# frozen_string_literal: true

module Square
  module Types
    # Defines the response returned by 
    # [CancelPaymentByIdempotencyKey](api-endpoint:Payments-CancelPaymentByIdempotencyKey).
    # On success, `errors` is empty.
    class CancelPaymentByIdempotencyKeyResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
