# frozen_string_literal: true

module Square
    module Types
        # The response returned by the `CancelInvoice` request.
        class CancelInvoiceResponse < Square::Internal::Types::Model
            field :invoice, Square::Invoice, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
