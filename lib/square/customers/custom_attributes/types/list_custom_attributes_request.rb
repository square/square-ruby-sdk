
module Square
    module Customers
        module CustomAttributes
            class ListCustomAttributesRequest
                field :customer_id, String, optional: false, nullable: false
                field :limit, Integer, optional: true, nullable: false
                field :cursor, String, optional: true, nullable: false
                field :with_definitions, Internal::Types::Boolean, optional: true, nullable: false
            end
        end
    end
end
