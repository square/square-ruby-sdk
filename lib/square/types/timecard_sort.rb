# frozen_string_literal: true

module Square
  # Sets the sort order of search results.
  class TimecardSort < Internal::Types::Model
    field :field, Square::TimecardSortField, optional: true, nullable: false
    field :order, Square::SortOrder, optional: true, nullable: false

  end
end
