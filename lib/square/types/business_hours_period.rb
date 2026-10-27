# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a period of time during which a business location is open.
    class BusinessHoursPeriod < Internal::Types::Model
      field :day_of_week, -> { Square::Types::DayOfWeek }, optional: true, nullable: false

      field :start_local_time, -> { String }, optional: true, nullable: true

      field :end_local_time, -> { String }, optional: true, nullable: true
    end
  end
end
