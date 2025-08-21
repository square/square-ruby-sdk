# frozen_string_literal: true

module Square
  module Types
    # Represents a time period of availability.
    class CatalogAvailabilityPeriod < Internal::Types::Model
      field :start_local_time, -> { String }, optional: true, nullable: false
      field :end_local_time, -> { String }, optional: true, nullable: false
      field :day_of_week, -> { Square::Types::DayOfWeek }, optional: true, nullable: false
    end
  end
end
