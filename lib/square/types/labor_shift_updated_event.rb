# frozen_string_literal: true

module Square
    module Types
        # Published when a [Shift](entity:Shift) is updated.
        # 
        # Deprecated at Square API version 2025-05-21. Replaced by `labor.timecard.updated`.
        class LaborShiftUpdatedEvent < Square::Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::LaborShiftUpdatedEventData, optional: true, nullable: false
        end
    end
end
