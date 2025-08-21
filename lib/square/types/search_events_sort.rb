# frozen_string_literal: true

module Square
  module Types
    # Criteria to sort events by.
    class SearchEventsSort < Internal::Types::Model
      field :field, -> { String }, optional: true, nullable: false
      field :order, -> { Square::Types::SortOrder }, optional: true, nullable: false
    end
  end
end
