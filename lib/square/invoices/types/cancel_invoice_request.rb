
module Square
  module Invoices
    module Types
      class CancelInvoiceRequest < Internal::Types::Model
        field :invoice_id, -> { String }, optional: false, nullable: false
        field :version, -> { Integer }, optional: false, nullable: false

      end
    end
  end
end
