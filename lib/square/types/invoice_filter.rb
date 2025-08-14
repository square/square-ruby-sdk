# frozen_string_literal: true

module Square
  module Types
    # Describes query filters to apply.
    class InvoiceFilter < Internal::Types::Model
      field :location_ids, Internal::Types::Array[String], optional: false, nullable: false
      field :customer_ids, Internal::Types::Array[String], optional: true, nullable: false

    end
  end
end
