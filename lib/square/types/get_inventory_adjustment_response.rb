# frozen_string_literal: true

module Square
  module Types
    class GetInventoryAdjustmentResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :adjustment, -> { Square::Types::InventoryAdjustment }, optional: true, nullable: false

    end
  end
end
