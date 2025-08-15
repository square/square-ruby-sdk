# frozen_string_literal: true

module Square
  # Contains query criteria for the search.
  class SearchOrdersQuery < Internal::Types::Model
    field :filter, Square::SearchOrdersFilter, optional: true, nullable: false
    field :sort, Square::SearchOrdersSort, optional: true, nullable: false

  end
end
