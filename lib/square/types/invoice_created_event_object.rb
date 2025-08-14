# frozen_string_literal: true

module Square
    module Types
        class InvoiceCreatedEventObject < Internal::Types::Model
            field :invoice, Square::Invoice, optional: true, nullable: false
        end
    end
end
