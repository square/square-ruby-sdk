# frozen_string_literal: true

module Square
    module Types
        # The query filter to return the items containing the specified modifier list IDs.
        class CatalogQueryItemsForModifierList < Square::Internal::Types::Model
            field :modifier_list_ids, Square::Internal::Types::Array[String], optional: false, nullable: false
        end
    end
end
