# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class BatchGetInventoryChangesResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

      field :changes, -> { Internal::Types::Array[Square::Types::InventoryChange] }, optional: true, nullable: false

      field :cursor, -> { String }, optional: true, nullable: false
    end
  end
end
