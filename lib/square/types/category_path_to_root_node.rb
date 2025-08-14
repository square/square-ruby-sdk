# frozen_string_literal: true

module Square
    module Types
        # A node in the path from a retrieved category to its root node.
        class CategoryPathToRootNode < Internal::Types::Model
            field :category_id, String, optional: true, nullable: false
            field :category_name, String, optional: true, nullable: false
        end
    end
end
