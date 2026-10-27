# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when the quantity is updated for a
    # [CatalogItemVariation](entity:CatalogItemVariation).
    class InventoryCountUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::InventoryCountUpdatedEventData }, optional: true, nullable: false
    end
  end
end
