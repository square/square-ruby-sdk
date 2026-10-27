# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Identifies the sort field and sort order.
    class InvoiceSort < Internal::Types::Model
      field :field, -> { String }, optional: false, nullable: false

      field :order, -> { Square::Types::SortOrder }, optional: true, nullable: false
    end
  end
end
