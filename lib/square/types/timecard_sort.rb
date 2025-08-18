# frozen_string_literal: true

module Square
  module Types
    # Sets the sort order of search results.
    class TimecardSort < Internal::Types::Model
      field :field, Square::Types::TimecardSortField, optional: true, nullable: false
      field :order, Square::Types::SortOrder, optional: true, nullable: false

    end
  end
end
