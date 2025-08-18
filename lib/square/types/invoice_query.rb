# frozen_string_literal: true

module Square
  module Types
    # Describes query criteria for searching invoices.
    class InvoiceQuery < Internal::Types::Model
      field :filter, Square::Types::InvoiceFilter, optional: false, nullable: false
      field :sort, Square::Types::InvoiceSort, optional: true, nullable: false

    end
  end
end
