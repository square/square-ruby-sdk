# frozen_string_literal: true

module Square
  class InvoiceCreatedEventObject < Internal::Types::Model
    field :invoice, Square::Invoice, optional: true, nullable: false

  end
end
