# frozen_string_literal: true

module Square
    module Types
        # The query filter to return the search result whose named attribute values fall between the specified range.
        class CatalogQueryRange < Square::Internal::Types::Model
            field :attribute_name, String, optional: false, nullable: false
            field :attribute_min_value, Integer, optional: true, nullable: false
            field :attribute_max_value, Integer, optional: true, nullable: false
        end
    end
end
