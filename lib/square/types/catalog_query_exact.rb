# frozen_string_literal: true

module Square
    module Types
        # The query filter to return the search result by exact match of the specified attribute name and value.
        class CatalogQueryExact < Square::Internal::Types::Model
            field :attribute_name, String, optional: false, nullable: false
            field :attribute_value, String, optional: false, nullable: false
        end
    end
end
