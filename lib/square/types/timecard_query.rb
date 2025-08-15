# frozen_string_literal: true

module Square
  # The parameters of a `Timecard` search query, which includes filter and sort options.
  class TimecardQuery < Internal::Types::Model
    field :filter, Square::TimecardFilter, optional: true, nullable: false
    field :sort, Square::TimecardSort, optional: true, nullable: false

  end
end
