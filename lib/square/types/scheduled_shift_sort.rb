# frozen_string_literal: true

module Square
  module Types
    # Defines sort criteria for a [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts)
    # request.
    class ScheduledShiftSort < Internal::Types::Model
      field :field, -> { Square::Types::ScheduledShiftSortField }, optional: true, nullable: false
      field :order, -> { Square::Types::SortOrder }, optional: true, nullable: false
    end
  end
end
