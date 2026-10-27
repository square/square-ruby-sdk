# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The query filter to return the search result whose named attribute values fall between the specified range.
    class CatalogQueryRange < Internal::Types::Model
      field :attribute_name, -> { String }, optional: false, nullable: false

      field :attribute_min_value, -> { Integer }, optional: true, nullable: true

      field :attribute_max_value, -> { Integer }, optional: true, nullable: true
    end
  end
end
