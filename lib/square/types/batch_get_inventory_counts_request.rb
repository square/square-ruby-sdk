# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class BatchGetInventoryCountsRequest < Internal::Types::Model
      field :catalog_object_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :updated_after, -> { String }, optional: true, nullable: true

      field :cursor, -> { String }, optional: true, nullable: true

      field :states, -> { Internal::Types::Array[Square::Types::InventoryState] }, optional: true, nullable: true

      field :limit, -> { Integer }, optional: true, nullable: true
    end
  end
end
