# frozen_string_literal: true

module Square
    module Types
        # Describes a `UpdateInvoice` response.
        class UpdateInvoiceResponse < Square::Internal::Types::Model
            field :invoice, Square::Invoice, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
