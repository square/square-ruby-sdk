# frozen_string_literal: true

module Square
  # A `Timecard` search query filter parameter that sets a range of days that
  # a `Timecard` must start or end in before passing the filter condition.
  class TimecardWorkday < Internal::Types::Model
    field :date_range, Square::DateRange, optional: true, nullable: false
    field :match_timecards_by, Square::TimecardWorkdayMatcher, optional: true, nullable: false
    field :default_timezone, String, optional: true, nullable: false

  end
end
