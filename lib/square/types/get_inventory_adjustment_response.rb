# frozen_string_literal: true

module Square
    module Types
        class GetInventoryAdjustmentResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :adjustment, Square::InventoryAdjustment, optional: true, nullable: false
        end
    end
end
