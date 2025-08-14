# frozen_string_literal: true

module Square
    module Types
        # The response to a request to get a `BreakType`. The response contains
        # the requested `BreakType` objects and might contain a set of `Error` objects if
        # the request resulted in errors.
        class GetBreakTypeResponse < Square::Internal::Types::Model
            field :break_type, Square::BreakType, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
