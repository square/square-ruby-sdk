# frozen_string_literal: true

module Square
  module Types
    class GetInventoryCountResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :counts, -> { Internal::Types::Array[Square::Types::InventoryCount] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false

    end
  end
end
