# frozen_string_literal: true

module Square
    module Types
        # Represents the transfer of a quantity of product inventory at a
        # particular time from one location to another.
        class InventoryTransfer < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :reference_id, String, optional: true, nullable: false
            field :state, Square::InventoryState, optional: true, nullable: false
            field :from_location_id, String, optional: true, nullable: false
            field :to_location_id, String, optional: true, nullable: false
            field :catalog_object_id, String, optional: true, nullable: false
            field :catalog_object_type, String, optional: true, nullable: false
            field :quantity, String, optional: true, nullable: false
            field :occurred_at, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :source, Square::SourceApplication, optional: true, nullable: false
            field :employee_id, String, optional: true, nullable: false
            field :team_member_id, String, optional: true, nullable: false
        end
    end
end
