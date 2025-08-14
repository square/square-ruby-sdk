
module Square
  module Payments
    class CompletePaymentRequest < Internal::Types::Model
      field :payment_id, String, optional: false, nullable: false
    end
  end
end
