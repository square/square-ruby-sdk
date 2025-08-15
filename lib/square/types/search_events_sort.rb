# frozen_string_literal: true

module Square
  # Criteria to sort events by.
  class SearchEventsSort < Internal::Types::Model
    field :field, String, optional: true, nullable: false
    field :order, Square::SortOrder, optional: true, nullable: false

  end
end
