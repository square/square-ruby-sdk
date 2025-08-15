# frozen_string_literal: true

module Square
  # The response returned by the `CancelInvoice` request.
  class CancelInvoiceResponse < Internal::Types::Model
    field :invoice, Square::Invoice, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
