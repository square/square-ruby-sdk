# frozen_string_literal: true

module Square
  module Types
    # Defines filter criteria for a [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts)
    # request. Multiple filters in a query are combined as an `AND` operation.
    class ScheduledShiftFilter < Internal::Types::Model
      field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :start, Square::TimeRange, optional: true, nullable: false
      field :end_, Square::TimeRange, optional: true, nullable: false
      field :workday, Square::ScheduledShiftWorkday, optional: true, nullable: false
      field :team_member_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :assignment_status, Square::ScheduledShiftFilterAssignmentStatus, optional: true, nullable: false
      field :scheduled_shift_statuses, Internal::Types::Array[Square::ScheduledShiftFilterScheduledShiftStatus], optional: true, nullable: false

    end
  end
end
