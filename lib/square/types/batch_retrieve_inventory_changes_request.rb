# frozen_string_literal: true

module Square
    module Types
        class BatchRetrieveInventoryChangesRequest < Square::Internal::Types::Model
            field :catalog_object_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :location_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :types, Square::Internal::Types::Array[Square::InventoryChangeType], optional: true, nullable: false
            field :states, Square::Internal::Types::Array[Square::InventoryState], optional: true, nullable: false
            field :updated_after, String, optional: true, nullable: false
            field :updated_before, String, optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
        end
    end
end
