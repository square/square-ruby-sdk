
module Square
    module Customers
        module CustomAttributes
            class UpsertCustomerCustomAttributeRequest < Internal::Types::Model
                field :customer_id, String, optional: false, nullable: false
                field :key, String, optional: false, nullable: false
            end
        end
    end
end
