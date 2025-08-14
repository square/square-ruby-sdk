# frozen_string_literal: true

module Square
    module Types
        class InventoryAdjustmentGroup < Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :root_adjustment_id, String, optional: true, nullable: false
            field :from_state, Square::InventoryState, optional: true, nullable: false
            field :to_state, Square::InventoryState, optional: true, nullable: false
        end
    end
end
