# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class BatchChangeInventoryRequest < Internal::Types::Model
      field :idempotency_key, -> { String }, optional: false, nullable: false

      field :changes, -> { Internal::Types::Array[Square::Types::InventoryChange] }, optional: true, nullable: true

      field :ignore_unchanged_counts, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
