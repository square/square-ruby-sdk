# frozen_string_literal: true

module Square
  # Describes a `GetInvoice` response.
  class GetInvoiceResponse < Internal::Types::Model
    field :invoice, Square::Invoice, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
