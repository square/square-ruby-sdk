# frozen_string_literal: true

module Square
  # Represents information about the overtime exemption status, job assignments, and compensation
  # for a [team member](entity:TeamMember).
  class WageSetting < Internal::Types::Model
    field :team_member_id, String, optional: true, nullable: false
    field :job_assignments, Internal::Types::Array[Square::JobAssignment], optional: true, nullable: false
    field :is_overtime_exempt, Internal::Types::Boolean, optional: true, nullable: false
    field :version, Integer, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
