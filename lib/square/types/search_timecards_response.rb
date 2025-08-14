# frozen_string_literal: true

module Square
    module Types
        # The response to a request for `Timecard` objects. The response contains
        # the requested `Timecard` objects and might contain a set of `Error` objects if
        # the request resulted in errors.
        class SearchTimecardsResponse < Square::Internal::Types::Model
            field :timecards, Square::Internal::Types::Array[Square::Timecard], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
