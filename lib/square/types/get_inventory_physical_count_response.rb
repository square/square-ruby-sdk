# frozen_string_literal: true

module Square
  module Types
    class GetInventoryPhysicalCountResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :count, -> { Square::Types::InventoryPhysicalCount }, optional: true, nullable: false
    end
  end
end
