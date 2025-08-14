# frozen_string_literal: true

module Square
  module Types
    class BatchGetInventoryCountsRequest < Internal::Types::Model
      field :catalog_object_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :updated_after, String, optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :states, Internal::Types::Array[Square::InventoryState], optional: true, nullable: false
      field :limit, Integer, optional: true, nullable: false

    end
  end
end
