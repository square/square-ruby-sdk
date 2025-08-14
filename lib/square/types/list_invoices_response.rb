# frozen_string_literal: true

module Square
    module Types
        # Describes a `ListInvoice` response.
        class ListInvoicesResponse < Square::Internal::Types::Model
            field :invoices, Square::Internal::Types::Array[Square::Invoice], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
