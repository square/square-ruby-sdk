# frozen_string_literal: true

module Square
    module Types
        class BatchGetInventoryCountsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :counts, Square::Internal::Types::Array[Square::InventoryCount], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
