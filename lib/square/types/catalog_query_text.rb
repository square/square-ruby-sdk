# frozen_string_literal: true

module Square
    module Types
        # The query filter to return the search result whose searchable attribute values contain all of the specified keywords or tokens, independent of the token order or case.
        class CatalogQueryText < Internal::Types::Model
            field :keywords, Internal::Types::Array[String], optional: false, nullable: false
        end
    end
end
