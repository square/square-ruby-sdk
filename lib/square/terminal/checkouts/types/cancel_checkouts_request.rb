
module Square
    module Terminal
        module Checkouts
            class CancelCheckoutsRequest < Internal::Types::Model
                field :checkout_id, String, optional: false, nullable: false
            end
        end
    end
end
