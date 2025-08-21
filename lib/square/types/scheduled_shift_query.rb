# frozen_string_literal: true

module Square
  module Types
    # Represents filter and sort criteria for the `query` field in a
    # [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts) request.
    class ScheduledShiftQuery < Internal::Types::Model
      field :filter, -> { Square::Types::ScheduledShiftFilter }, optional: true, nullable: false
      field :sort, -> { Square::Types::ScheduledShiftSort }, optional: true, nullable: false
    end
  end
end
