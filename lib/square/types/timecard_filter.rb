# frozen_string_literal: true

module Square
    module Types
        # Defines a filter used in a search for `Timecard` records. `AND` logic is
        # used by Square's servers to apply each filter property specified.
        class TimecardFilter < Internal::Types::Model
            field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
            field :status, Square::TimecardFilterStatus, optional: true, nullable: false
            field :start, Square::TimeRange, optional: true, nullable: false
            field :end_, Square::TimeRange, optional: true, nullable: false
            field :workday, Square::TimecardWorkday, optional: true, nullable: false
            field :team_member_ids, Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
