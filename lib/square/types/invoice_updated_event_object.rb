# frozen_string_literal: true

module Square
    module Types
        class InvoiceUpdatedEventObject < Internal::Types::Model
            field :invoice, Square::Invoice, optional: true, nullable: false
        end
    end
end
