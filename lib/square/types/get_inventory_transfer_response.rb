# frozen_string_literal: true

module Square
    module Types
        class GetInventoryTransferResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :transfer, Square::InventoryTransfer, optional: true, nullable: false
        end
    end
end
