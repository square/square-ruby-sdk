# frozen_string_literal: true

module Square
  module Invoices
    module Types
      class UpdateInvoiceRequest < Internal::Types::Model
        field :invoice_id, -> { String }, optional: false, nullable: false

        field :invoice, -> { Square::Types::Invoice }, optional: false, nullable: false

        field :idempotency_key, -> { String }, optional: true, nullable: true

        field :fields_to_clear, -> { Internal::Types::Array[String] }, optional: true, nullable: true
      end
    end
  end
end
