# frozen_string_literal: true

module Square
    module Types
        class BatchChangeInventoryResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :counts, Square::Internal::Types::Array[Square::InventoryCount], optional: true, nullable: false
            field :changes, Square::Internal::Types::Array[Square::InventoryChange], optional: true, nullable: false
        end
    end
end
