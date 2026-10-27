# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A node in the path from a retrieved category to its root node.
    class CategoryPathToRootNode < Internal::Types::Model
      field :category_id, -> { String }, optional: true, nullable: true

      field :category_name, -> { String }, optional: true, nullable: true
    end
  end
end
