
module Square
    module Customers
        module Groups
            class RemoveGroupsRequest
                field :customer_id, String, optional: false, nullable: false
                field :group_id, String, optional: false, nullable: false
            end
        end
    end
end
