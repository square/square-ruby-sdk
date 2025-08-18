
module Square
  module Invoices
    module Types
      class CreateInvoiceRequest < Internal::Types::Model
        field :invoice, Square::Types::Invoice, optional: false, nullable: false
        field :idempotency_key, String, optional: true, nullable: false

      end
    end
  end
end
