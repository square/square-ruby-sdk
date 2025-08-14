
module Square
    module Customers
        class DeleteCustomersRequest < Square::Internal::Types::Model
            field :customer_id, String, optional: false, nullable: false
            field :version, Integer, optional: true, nullable: false
        end
    end
end
