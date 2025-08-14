# frozen_string_literal: true

module Square
    module Types
        # A record of the hourly rate, start time, and end time of a single timecard (shift)
        # for a team member. This might include a record of the start and end times of breaks
        # taken during the shift.
        class Timecard < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :location_id, String, optional: false, nullable: false
            field :timezone, String, optional: true, nullable: false
            field :start_at, String, optional: false, nullable: false
            field :end_at, String, optional: true, nullable: false
            field :wage, Square::TimecardWage, optional: true, nullable: false
            field :breaks, Square::Internal::Types::Array[Square::Break], optional: true, nullable: false
            field :status, Square::TimecardStatus, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :team_member_id, String, optional: false, nullable: false
            field :declared_cash_tip_money, Square::Money, optional: true, nullable: false
        end
    end
end
