# frozen_string_literal: true

module Square
    module Types
        # Describes query criteria for searching invoices.
        class InvoiceQuery < Square::Internal::Types::Model
            field :filter, Square::InvoiceFilter, optional: false, nullable: false
            field :sort, Square::InvoiceSort, optional: true, nullable: false
        end
    end
end
