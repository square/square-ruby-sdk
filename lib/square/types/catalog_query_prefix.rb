# frozen_string_literal: true

module Square
  module Types
    # The query filter to return the search result whose named attribute values are prefixed by the specified attribute value.
    class CatalogQueryPrefix < Internal::Types::Model
      field :attribute_name, String, optional: false, nullable: false
      field :attribute_prefix, String, optional: false, nullable: false

    end
  end
end
