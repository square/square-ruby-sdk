# frozen_string_literal: true

module Square
  module Types
    # Represents the quantity of an item variation that is physically present
    # at a specific location, verified by a seller or a seller's employee. For example,
    # a physical count might come from an employee counting the item variations on
    # hand or from syncing with an external system.
    class InventoryPhysicalCount < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :reference_id, String, optional: true, nullable: false
      field :catalog_object_id, String, optional: true, nullable: false
      field :catalog_object_type, String, optional: true, nullable: false
      field :state, Square::Types::InventoryState, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false
      field :quantity, String, optional: true, nullable: false
      field :source, Square::Types::SourceApplication, optional: true, nullable: false
      field :employee_id, String, optional: true, nullable: false
      field :team_member_id, String, optional: true, nullable: false
      field :occurred_at, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false

    end
  end
end
