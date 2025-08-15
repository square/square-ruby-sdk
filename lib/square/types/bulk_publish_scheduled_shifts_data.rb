# frozen_string_literal: true

module Square
  # Represents options for an individual publish request in a
  # [BulkPublishScheduledShifts](api-endpoint:Labor-BulkPublishScheduledShifts)
  # operation, provided as the value in a key-value pair.
  class BulkPublishScheduledShiftsData < Internal::Types::Model
    field :version, Integer, optional: true, nullable: false

  end
end
