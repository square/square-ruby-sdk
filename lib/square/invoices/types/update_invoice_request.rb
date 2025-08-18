
module Square
  module Invoices
    module Types
      class UpdateInvoiceRequest < Internal::Types::Model
        field :invoice_id, -> { String }, optional: false, nullable: false
        field :invoice, -> { Square::Types::Invoice }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: true, nullable: false
        field :fields_to_clear, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      end
    end
  end
end
