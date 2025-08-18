# frozen_string_literal: true

module Square
  module Types
    # Sorting criteria for a `SearchOrders` request. Results can only be sorted
    # by a timestamp field.
    class SearchOrdersSort < Internal::Types::Model
      field :sort_field, -> { Square::Types::SearchOrdersSortField }, optional: false, nullable: false
      field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false

    end
  end
end
