# frozen_string_literal: true

module Square
    module Types
        # Describes query filters to apply.
        class InvoiceFilter < Square::Internal::Types::Model
            field :location_ids, Square::Internal::Types::Array[String], optional: false, nullable: false
            field :customer_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
