# frozen_string_literal: true

module Square
  module Types
    class LaborScheduledShiftCreatedEventObject < Internal::Types::Model
      field :scheduled_shift, -> { Square::Types::ScheduledShift }, optional: true, nullable: false, api_name: "ScheduledShift"
    end
  end
end
