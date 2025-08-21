# frozen_string_literal: true

module Square
  module Types
    # Published when a booking [custom attribute definition](entity:CustomAttributeDefinition)
    # with the `visibility` field set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES` is updated.
    # An application that subscribes to this event is notified when a booking custom attribute definition is updated
    # by any application for which the subscribing application has read access to the booking custom attribute definition.
    class BookingCustomAttributeDefinitionVisibleUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::CustomAttributeDefinitionEventData }, optional: true, nullable: false
    end
  end
end
