# frozen_string_literal: true

module Square
    module Types
        # The hourly wage rate used to compensate a team member for a [timecard](entity:Timecard).
        class TimecardWage < Internal::Types::Model
            field :title, String, optional: true, nullable: false
            field :hourly_rate, Square::Money, optional: true, nullable: false
            field :job_id, String, optional: true, nullable: false
            field :tip_eligible, Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
