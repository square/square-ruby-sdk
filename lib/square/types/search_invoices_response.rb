# frozen_string_literal: true

module Square
  # Describes a `SearchInvoices` response.
  class SearchInvoicesResponse < Internal::Types::Model
    field :invoices, Internal::Types::Array[Square::Invoice], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
