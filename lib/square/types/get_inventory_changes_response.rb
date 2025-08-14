# frozen_string_literal: true

module Square
    module Types
        class GetInventoryChangesResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :changes, Square::Internal::Types::Array[Square::InventoryChange], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
