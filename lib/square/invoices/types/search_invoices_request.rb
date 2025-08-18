
module Square
  module Invoices
    module Types
      class SearchInvoicesRequest < Internal::Types::Model
        field :query, Square::Types::InvoiceQuery, optional: false, nullable: false
        field :limit, Integer, optional: true, nullable: false
        field :cursor, String, optional: true, nullable: false

      end
    end
  end
end
