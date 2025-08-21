# frozen_string_literal: true

module Square
  module Types
    # The query filter to return the search result(s) by exact match of the specified `attribute_name` and any of
    # the `attribute_values`.
    class CatalogQuerySet < Internal::Types::Model
      field :attribute_name, -> { String }, optional: false, nullable: false
      field :attribute_values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
