
module Square
    module Locations
        module Transactions
            class VoidTransactionsRequest
                field :location_id, String, optional: false, nullable: false
                field :transaction_id, String, optional: false, nullable: false
            end
        end
    end
end
