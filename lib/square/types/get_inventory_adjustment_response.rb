# frozen_string_literal: true

module Square
  class GetInventoryAdjustmentResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :adjustment, Square::InventoryAdjustment, optional: true, nullable: false

  end
end
