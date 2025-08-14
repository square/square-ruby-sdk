# frozen_string_literal: true

module Square
    module Types
        class GetInventoryPhysicalCountResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :count, Square::InventoryPhysicalCount, optional: true, nullable: false
        end
    end
end
