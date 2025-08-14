# frozen_string_literal: true

module Square
    module Types
        # A `Shift` search query filter parameter that sets a range of days that
        # a `Shift` must start or end in before passing the filter condition.
        # 
        # Deprecated at Square API version 2025-05-21. See the [migration notes](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
        class ShiftWorkday < Square::Internal::Types::Model
            field :date_range, Square::DateRange, optional: true, nullable: false
            field :match_shifts_by, Square::ShiftWorkdayMatcher, optional: true, nullable: false
            field :default_timezone, String, optional: true, nullable: false
        end
    end
end
