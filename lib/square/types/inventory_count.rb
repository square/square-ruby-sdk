# frozen_string_literal: true

module Square
  module Types
    # Represents Square-estimated quantity of items in a particular state at a
    # particular seller location based on the known history of physical counts and
    # inventory adjustments.
    class InventoryCount < Internal::Types::Model
      field :catalog_object_id, String, optional: true, nullable: false
      field :catalog_object_type, String, optional: true, nullable: false
      field :state, Square::InventoryState, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false
      field :quantity, String, optional: true, nullable: false
      field :calculated_at, String, optional: true, nullable: false
      field :is_estimated, Internal::Types::Boolean, optional: true, nullable: false

    end
  end
end
