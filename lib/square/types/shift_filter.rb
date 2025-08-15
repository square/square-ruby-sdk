# frozen_string_literal: true

module Square
  # Defines a filter used in a search for `Shift` records. `AND` logic is
  # used by Square's servers to apply each filter property specified.
  # 
  # Deprecated at Square API version 2025-05-21. See the [migration notes](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
  class ShiftFilter < Internal::Types::Model
    field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :employee_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :status, Square::ShiftFilterStatus, optional: true, nullable: false
    field :start, Square::TimeRange, optional: true, nullable: false
    field :end_, Square::TimeRange, optional: true, nullable: false
    field :workday, Square::ShiftWorkday, optional: true, nullable: false
    field :team_member_ids, Internal::Types::Array[String], optional: true, nullable: false

  end
end
