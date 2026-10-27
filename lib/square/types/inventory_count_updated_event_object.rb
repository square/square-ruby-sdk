# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class InventoryCountUpdatedEventObject < Internal::Types::Model
      field :inventory_counts, -> { Internal::Types::Array[Square::Types::InventoryCount] }, optional: true, nullable: true
    end
  end
end
