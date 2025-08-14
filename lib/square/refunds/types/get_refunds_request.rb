
module Square
    module Refunds
        class GetRefundsRequest < Square::Internal::Types::Model
            field :refund_id, String, optional: false, nullable: false
        end
    end
end
