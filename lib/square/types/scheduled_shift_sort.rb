# frozen_string_literal: true

module Square
    module Types
        # Defines sort criteria for a [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts)
        # request.
        class ScheduledShiftSort < Square::Internal::Types::Model
            field :field, Square::ScheduledShiftSortField, optional: true, nullable: false
            field :order, Square::SortOrder, optional: true, nullable: false
        end
    end
end
