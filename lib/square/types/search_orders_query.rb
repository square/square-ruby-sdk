# frozen_string_literal: true

module Square
  module Types
    # Contains query criteria for the search.
    class SearchOrdersQuery < Internal::Types::Model
      field :filter, -> { Square::Types::SearchOrdersFilter }, optional: true, nullable: false
      field :sort, -> { Square::Types::SearchOrdersSort }, optional: true, nullable: false

    end
  end
end
