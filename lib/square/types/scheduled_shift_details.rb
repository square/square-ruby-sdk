# frozen_string_literal: true

module Square
    module Types
        # Represents shift details for draft and published versions of a [scheduled shift](entity:ScheduledShift),
        # such as job ID, team member assignment, and start and end times.
        class ScheduledShiftDetails < Square::Internal::Types::Model
            field :team_member_id, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :job_id, String, optional: true, nullable: false
            field :start_at, String, optional: true, nullable: false
            field :end_at, String, optional: true, nullable: false
            field :notes, String, optional: true, nullable: false
            field :is_deleted, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :timezone, String, optional: true, nullable: false
        end
    end
end
