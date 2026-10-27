# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The query expression to specify the key to sort search results.
    class CatalogQuerySortedAttribute < Internal::Types::Model
      field :attribute_name, -> { String }, optional: false, nullable: false

      field :initial_attribute_value, -> { String }, optional: true, nullable: true

      field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false
    end
  end
end
