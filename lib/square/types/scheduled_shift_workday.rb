# frozen_string_literal: true

module Square
    module Types
        # A `ScheduledShift` search query filter parameter that sets a range of days that
        # a `Shift` must start or end in before passing the filter condition.
        class ScheduledShiftWorkday < Square::Internal::Types::Model
            field :date_range, Square::DateRange, optional: true, nullable: false
            field :match_scheduled_shifts_by, Square::ScheduledShiftWorkdayMatcher, optional: true, nullable: false
            field :default_timezone, String, optional: true, nullable: false
        end
    end
end
