# frozen_string_literal: true

module Square
    module Types
        # Published when a [ScheduledShift](entity:ScheduledShift) is created.
        class LaborScheduledShiftCreatedEvent < Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::LaborScheduledShiftCreatedEventData, optional: true, nullable: false
        end
    end
end
