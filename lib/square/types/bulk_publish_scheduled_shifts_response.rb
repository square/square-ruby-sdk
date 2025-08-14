# frozen_string_literal: true

module Square
    module Types
        # Represents a [BulkPublishScheduledShifts](api-endpoint:Labor-BulkPublishScheduledShifts) response.
        # Either `scheduled_shifts` or `errors` is present in the response.
        class BulkPublishScheduledShiftsResponse < Square::Internal::Types::Model
            field :responses, Square::Internal::Types::Hash[String, Square::PublishScheduledShiftResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
