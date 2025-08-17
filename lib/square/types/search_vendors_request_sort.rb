# frozen_string_literal: true

module Square
  module Types
    # Defines a sorter used to sort results from [SearchVendors](api-endpoint:Vendors-SearchVendors).
    class SearchVendorsRequestSort < Internal::Types::Model
      field :field, Square::Types::SearchVendorsRequestSortField, optional: true, nullable: false
      field :order, Square::Types::SortOrder, optional: true, nullable: false

    end
  end
end
