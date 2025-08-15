# frozen_string_literal: true

module Square
  # Defines sort criteria for a [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts)
  # request.
  class ScheduledShiftSort < Internal::Types::Model
    field :field, Square::ScheduledShiftSortField, optional: true, nullable: false
    field :order, Square::SortOrder, optional: true, nullable: false

  end
end
