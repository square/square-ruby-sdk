# frozen_string_literal: true

module Square
  module Types
    class BatchChangeInventoryResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :counts, -> { Internal::Types::Array[Square::Types::InventoryCount] }, optional: true, nullable: false
      field :changes, -> { Internal::Types::Array[Square::Types::InventoryChange] }, optional: true, nullable: false
    end
  end
end
