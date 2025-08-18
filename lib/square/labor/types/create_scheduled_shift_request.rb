
module Square
  module Labor
    module Types
      class CreateScheduledShiftRequest < Internal::Types::Model
        field :idempotency_key, String, optional: true, nullable: false
        field :scheduled_shift, Square::Types::ScheduledShift, optional: false, nullable: false

      end
    end
  end
end
