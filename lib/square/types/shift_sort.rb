# frozen_string_literal: true

module Square
    module Types
        # Sets the sort order of search results.
        # 
        # Deprecated at Square API version 2025-05-21. See the [migration notes](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
        class ShiftSort < Internal::Types::Model
            field :field, Square::ShiftSortField, optional: true, nullable: false
            field :order, Square::SortOrder, optional: true, nullable: false
        end
    end
end
