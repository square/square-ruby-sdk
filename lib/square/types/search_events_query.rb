# frozen_string_literal: true

module Square
  module Types
    # Contains query criteria for the search.
    class SearchEventsQuery < Internal::Types::Model
      field :filter, -> { Square::Types::SearchEventsFilter }, optional: true, nullable: false
      field :sort, -> { Square::Types::SearchEventsSort }, optional: true, nullable: false
    end
  end
end
