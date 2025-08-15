# frozen_string_literal: true

module Square
  # Identifies the sort field and sort order.
  class InvoiceSort < Internal::Types::Model
    field :field, String, optional: false, nullable: false
    field :order, Square::SortOrder, optional: true, nullable: false

  end
end
