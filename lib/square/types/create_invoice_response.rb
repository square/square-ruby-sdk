# frozen_string_literal: true

module Square
    module Types
        # The response returned by the `CreateInvoice` request.
        class CreateInvoiceResponse < Internal::Types::Model
            field :invoice, Square::Invoice, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
