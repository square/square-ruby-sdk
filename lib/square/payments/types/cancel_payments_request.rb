
module Square
    module Payments
        class CancelPaymentsRequest < Square::Internal::Types::Model
            field :payment_id, String, optional: false, nullable: false
        end
    end
end
