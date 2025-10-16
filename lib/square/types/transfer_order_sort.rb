# frozen_string_literal: true

module Square
  module Types
    # Sort configuration for search results
    class TransferOrderSort < Internal::Types::Model
      field :field, -> { Square::Types::TransferOrderSortField }, optional: true, nullable: false
      field :order, -> { Square::Types::SortOrder }, optional: true, nullable: false
    end
  end
end
