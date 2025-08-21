# frozen_string_literal: true

module Square
  module Types
    # A `ScheduledShift` search query filter parameter that sets a range of days that
    # a `Shift` must start or end in before passing the filter condition.
    class ScheduledShiftWorkday < Internal::Types::Model
      field :date_range, -> { Square::Types::DateRange }, optional: true, nullable: false
      field :match_scheduled_shifts_by, lambda {
        Square::Types::ScheduledShiftWorkdayMatcher
      }, optional: true, nullable: false
      field :default_timezone, -> { String }, optional: true, nullable: false
    end
  end
end
