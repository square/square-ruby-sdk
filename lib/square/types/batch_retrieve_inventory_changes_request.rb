# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class BatchRetrieveInventoryChangesRequest < Internal::Types::Model
      field :catalog_object_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :types, -> { Internal::Types::Array[Square::Types::InventoryChangeType] }, optional: true, nullable: true

      field :states, -> { Internal::Types::Array[Square::Types::InventoryState] }, optional: true, nullable: true

      field :updated_after, -> { String }, optional: true, nullable: true

      field :updated_before, -> { String }, optional: true, nullable: true

      field :cursor, -> { String }, optional: true, nullable: true

      field :limit, -> { Integer }, optional: true, nullable: true

      field :sort, -> { Square::Types::BatchRetrieveInventoryChangesSort }, optional: true, nullable: false

      field :reason_ids, -> { Internal::Types::Array[Square::Types::InventoryAdjustmentReasonId] }, optional: true, nullable: true
    end
  end
end
