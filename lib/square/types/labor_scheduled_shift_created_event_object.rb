# frozen_string_literal: true

module Square
  class LaborScheduledShiftCreatedEventObject < Internal::Types::Model
    field :scheduled_shift, Square::ScheduledShift, optional: true, nullable: false

  end
end
