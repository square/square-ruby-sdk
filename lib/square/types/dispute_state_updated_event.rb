# frozen_string_literal: true

module Square
  module Types
    # Published when the state of a [Dispute](entity:Dispute) changes.
    # This includes the dispute resolution (WON, LOST) reported by the bank. The event
    # data includes details of what changed.
    class DisputeStateUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :location_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::DisputeStateUpdatedEventData }, optional: true, nullable: false
    end
  end
end
