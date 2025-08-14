# frozen_string_literal: true

module Square
  module Types
    # Represents a [BulkPublishScheduledShifts](api-endpoint:Labor-BulkPublishScheduledShifts) response.
    # Either `scheduled_shifts` or `errors` is present in the response.
    class BulkPublishScheduledShiftsResponse < Internal::Types::Model
      field :responses, Internal::Types::Hash[String, Square::PublishScheduledShiftResponse], optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
