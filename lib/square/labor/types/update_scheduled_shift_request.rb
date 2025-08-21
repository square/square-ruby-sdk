# frozen_string_literal: true

module Square
  module Labor
    module Types
      class UpdateScheduledShiftRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :scheduled_shift, -> { Square::Types::ScheduledShift }, optional: false, nullable: false
      end
    end
  end
end
