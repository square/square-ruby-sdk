# frozen_string_literal: true

module Square
    module Types
        class LaborScheduledShiftUpdatedEventObject < Square::Internal::Types::Model
            field :scheduled_shift, Square::ScheduledShift, optional: true, nullable: false
        end
    end
end
