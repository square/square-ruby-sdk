# frozen_string_literal: true

module Square
    module Types
        # Contains query criteria for the search.
        class SearchEventsQuery < Square::Internal::Types::Model
            field :filter, Square::SearchEventsFilter, optional: true, nullable: false
            field :sort, Square::SearchEventsSort, optional: true, nullable: false
        end
    end
end
