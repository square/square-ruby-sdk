# frozen_string_literal: true

module Square
  class GetInventoryPhysicalCountResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :count, Square::InventoryPhysicalCount, optional: true, nullable: false

  end
end
