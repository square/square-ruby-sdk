# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents shift details for draft and published versions of a [scheduled shift](entity:ScheduledShift),
    # such as job ID, team member assignment, and start and end times.
    class ScheduledShiftDetails < Internal::Types::Model
      field :team_member_id, -> { String }, optional: true, nullable: true

      field :location_id, -> { String }, optional: true, nullable: true

      field :job_id, -> { String }, optional: true, nullable: true

      field :start_at, -> { String }, optional: true, nullable: true

      field :end_at, -> { String }, optional: true, nullable: true

      field :notes, -> { String }, optional: true, nullable: true

      field :is_deleted, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :timezone, -> { String }, optional: true, nullable: false
    end
  end
end
