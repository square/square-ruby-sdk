# frozen_string_literal: true

module Square
    module Types
        # A record of the hourly rate, start, and end times for a single work shift
        # for an employee. This might include a record of the start and end times for breaks
        # taken during the shift.
        # 
        # Deprecated at Square API version 2025-05-21. Replaced by [Timecard](entity:Timecard).
        # See the [migration notes](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
        class Shift < Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :employee_id, String, optional: true, nullable: false
            field :location_id, String, optional: false, nullable: false
            field :timezone, String, optional: true, nullable: false
            field :start_at, String, optional: false, nullable: false
            field :end_at, String, optional: true, nullable: false
            field :wage, Square::ShiftWage, optional: true, nullable: false
            field :breaks, Internal::Types::Array[Square::Break], optional: true, nullable: false
            field :status, Square::ShiftStatus, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :team_member_id, String, optional: true, nullable: false
            field :declared_cash_tip_money, Square::Money, optional: true, nullable: false
        end
    end
end
