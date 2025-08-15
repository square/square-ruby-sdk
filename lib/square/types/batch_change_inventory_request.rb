# frozen_string_literal: true

module Square
  class BatchChangeInventoryRequest < Internal::Types::Model
    field :idempotency_key, String, optional: false, nullable: false
    field :changes, Internal::Types::Array[Square::InventoryChange], optional: true, nullable: false
    field :ignore_unchanged_counts, Internal::Types::Boolean, optional: true, nullable: false

  end
end
