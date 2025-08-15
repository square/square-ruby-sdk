# frozen_string_literal: true

module Square
  # Published when a booking [custom attribute](entity:CustomAttribute) 
  # associated with a [custom attribute definition](entity:CustomAttributeDefinition) that is
  # owned by the subscribing application is deleted.
  # Subscribe to this event to be notified 
  # when your application deletes a booking custom attribute.
  class BookingCustomAttributeOwnedDeletedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::CustomAttributeEventData, optional: true, nullable: false

  end
end
