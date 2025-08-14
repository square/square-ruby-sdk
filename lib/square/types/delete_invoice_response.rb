# frozen_string_literal: true

module Square
    module Types
        # Describes a `DeleteInvoice` response.
        class DeleteInvoiceResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
