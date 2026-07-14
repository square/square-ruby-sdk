# frozen_string_literal: true

module Square
  module Types
    class BatchRetrieveInventoryChangesSort < Internal::Types::Model
      field :field, -> { String }, optional: true, nullable: false
      field :order, -> { Square::Types::SortOrder }, optional: true, nullable: false
    end
  end
end
