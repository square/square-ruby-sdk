# frozen_string_literal: true

module Square
  # Published when a booking [custom attribute definition](entity:CustomAttributeDefinition) 
  # with the `visibility` field set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES` is created.
  # An application that subscribes to this event is notified when a booking custom attribute definition is created 
  # by any application for which the subscribing application has read access to the booking custom attribute definition.
  class BookingCustomAttributeDefinitionVisibleCreatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::CustomAttributeDefinitionEventData, optional: true, nullable: false

  end
end
