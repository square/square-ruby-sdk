
module Square
  module Invoices
    module Types
      class PublishInvoiceRequest < Internal::Types::Model
        field :invoice_id, -> { String }, optional: false, nullable: false
        field :version, -> { Integer }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: true, nullable: false

      end
    end
  end
end
