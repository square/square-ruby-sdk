# frozen_string_literal: true

module Square
    module Types
        # Represents a job assigned to a [team member](entity:TeamMember), including the compensation the team
        # member earns for the job. Job assignments are listed in the team member's [wage setting](entity:WageSetting).
        class JobAssignment < Square::Internal::Types::Model
            field :job_title, String, optional: true, nullable: false
            field :pay_type, Square::JobAssignmentPayType, optional: false, nullable: false
            field :hourly_rate, Square::Money, optional: true, nullable: false
            field :annual_rate, Square::Money, optional: true, nullable: false
            field :weekly_hours, Integer, optional: true, nullable: false
            field :job_id, String, optional: true, nullable: false
        end
    end
end
