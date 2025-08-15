# frozen_string_literal: true

module Square
  # Describes a `UpdateInvoice` response.
  class UpdateInvoiceResponse < Internal::Types::Model
    field :invoice, Square::Invoice, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
