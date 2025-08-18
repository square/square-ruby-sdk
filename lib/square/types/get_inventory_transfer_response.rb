# frozen_string_literal: true

module Square
  module Types
    class GetInventoryTransferResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :transfer, -> { Square::Types::InventoryTransfer }, optional: true, nullable: false

    end
  end
end
