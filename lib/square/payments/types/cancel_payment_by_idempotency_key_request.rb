
module Square
  module Payments
    module Types
      class CancelPaymentByIdempotencyKeyRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false

      end
    end
  end
end
