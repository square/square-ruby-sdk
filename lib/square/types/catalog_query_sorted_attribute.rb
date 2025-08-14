# frozen_string_literal: true

module Square
  module Types
    # The query expression to specify the key to sort search results.
    class CatalogQuerySortedAttribute < Internal::Types::Model
      field :attribute_name, String, optional: false, nullable: false
      field :initial_attribute_value, String, optional: true, nullable: false
      field :sort_order, Square::SortOrder, optional: true, nullable: false

    end
  end
end
