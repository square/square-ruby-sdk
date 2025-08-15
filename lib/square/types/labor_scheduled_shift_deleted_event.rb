# frozen_string_literal: true

module Square
  # Published when a [ScheduledShift](entity:ScheduledShift) is deleted.
  class LaborScheduledShiftDeletedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :location_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::LaborScheduledShiftDeletedEventData, optional: true, nullable: false

  end
end
