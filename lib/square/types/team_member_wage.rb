# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Job and wage information for a [team member](entity:TeamMember).
    # This convenience object provides details needed to specify the `wage`
    # field for a [timecard](entity:Timecard).
    class TeamMemberWage < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :team_member_id, -> { String }, optional: true, nullable: true

      field :title, -> { String }, optional: true, nullable: true

      field :hourly_rate, -> { Square::Types::Money }, optional: true, nullable: false

      field :job_id, -> { String }, optional: true, nullable: true

      field :tip_eligible, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
