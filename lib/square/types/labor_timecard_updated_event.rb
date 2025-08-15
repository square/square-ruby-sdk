# frozen_string_literal: true

module Square
  # Published when a [Timecard](entity:Timecard) is updated.
  class LaborTimecardUpdatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::LaborTimecardUpdatedEventData, optional: true, nullable: false

  end
end
