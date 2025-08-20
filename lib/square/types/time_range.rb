# frozen_string_literal: true

module Square
  module Types
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    class TimeRange < Internal::Types::Model
      field :start_at, -> { String }, optional: true, nullable: false
      field :end_at, -> { String }, optional: true, nullable: false
    end
  end
end
