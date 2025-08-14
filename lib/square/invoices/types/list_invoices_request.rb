
module Square
    module Invoices
        class ListInvoicesRequest < Square::Internal::Types::Model
            field :location_id, String, optional: false, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
        end
    end
end
