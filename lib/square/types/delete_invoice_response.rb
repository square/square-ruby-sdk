# frozen_string_literal: true

module Square
  # Describes a `DeleteInvoice` response.
  class DeleteInvoiceResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
