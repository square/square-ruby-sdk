# frozen_string_literal: true

module Square
    module Types
        class BatchChangeInventoryRequest < Square::Internal::Types::Model
            field :idempotency_key, String, optional: false, nullable: false
            field :changes, Square::Internal::Types::Array[Square::InventoryChange], optional: true, nullable: false
            field :ignore_unchanged_counts, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
