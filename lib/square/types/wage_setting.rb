# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents information about the overtime exemption status, job assignments, and compensation
    # for a [team member](entity:TeamMember).
    class WageSetting < Internal::Types::Model
      field :team_member_id, -> { String }, optional: true, nullable: true

      field :job_assignments, -> { Internal::Types::Array[Square::Types::JobAssignment] }, optional: true, nullable: true

      field :is_overtime_exempt, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :version, -> { Integer }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
