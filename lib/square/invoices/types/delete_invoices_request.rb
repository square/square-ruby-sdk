
module Square
    module Invoices
        class DeleteInvoicesRequest < Square::Internal::Types::Model
            field :invoice_id, String, optional: false, nullable: false
            field :version, Integer, optional: true, nullable: false
        end
    end
end
