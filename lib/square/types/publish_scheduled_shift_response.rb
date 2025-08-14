# frozen_string_literal: true

module Square
    module Types
        # Represents a [PublishScheduledShift](api-endpoint:Labor-PublishScheduledShift) response.
        # Either `scheduled_shift` or `errors` is present in the response.
        class PublishScheduledShiftResponse < Square::Internal::Types::Model
            field :scheduled_shift, Square::ScheduledShift, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
