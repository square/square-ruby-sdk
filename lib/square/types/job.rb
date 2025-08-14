# frozen_string_literal: true

module Square
    module Types
        # Represents a job that can be assigned to [team members](entity:TeamMember). This object defines the
        # job's title and tip eligibility. Compensation is defined in a [job assignment](entity:JobAssignment)
        # in a team member's wage setting.
        class Job < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :title, String, optional: true, nullable: false
            field :is_tip_eligible, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
        end
    end
end
