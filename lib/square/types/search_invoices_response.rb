# frozen_string_literal: true

module Square
  module Types
    # Describes a `SearchInvoices` response.
    class SearchInvoicesResponse < Internal::Types::Model
      field :invoices, Internal::Types::Array[Square::Types::Invoice], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
