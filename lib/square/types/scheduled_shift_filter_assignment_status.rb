# frozen_string_literal: true

module SquareApiClient
# Defines valid values for the `assignment_status` filter in a
#  [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts) request.
#  Assignment status is based on the `draft_shift_details.team_member_id` and
#  `published_shift_details.team_member_id` fields of the scheduled shift.
  class ScheduledShiftFilterAssignmentStatus

    ASSIGNED = "ASSIGNED"
    UNASSIGNED = "UNASSIGNED"

  end
end