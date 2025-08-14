# frozen_string_literal: true

module Square
    module Types
        # The parameters of a `Timecard` search query, which includes filter and sort options.
        class TimecardQuery < Square::Internal::Types::Model
            field :filter, Square::TimecardFilter, optional: true, nullable: false
            field :sort, Square::TimecardSort, optional: true, nullable: false
        end
    end
end
