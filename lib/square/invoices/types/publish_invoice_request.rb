
module Square
    module Invoices
        class PublishInvoiceRequest < Square::Internal::Types::Model
            field :invoice_id, String, optional: false, nullable: false
        end
    end
end
