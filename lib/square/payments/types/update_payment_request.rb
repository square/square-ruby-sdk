
module Square
  module Payments
    module Types
      class UpdatePaymentRequest < Internal::Types::Model
        field :payment_id, String, optional: false, nullable: false
        field :payment, Square::Types::Payment, optional: true, nullable: false
        field :idempotency_key, String, optional: false, nullable: false

      end
    end
  end
end
