
module Square
  module Payments
    module Types
      class CancelPaymentsRequest < Internal::Types::Model
        field :payment_id, String, optional: false, nullable: false

      end
    end
  end
end
