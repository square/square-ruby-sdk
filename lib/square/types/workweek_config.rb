# frozen_string_literal: true

module Square
  # Sets the day of the week and hour of the day that a business starts a
  # workweek. This is used to calculate overtime pay.
  class WorkweekConfig < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :start_of_week, Square::Weekday, optional: false, nullable: false
    field :start_of_day_local_time, String, optional: false, nullable: false
    field :version, Integer, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
