# frozen_string_literal: true

module Square
  # Published when an order [custom attribute](entity:CustomAttribute) that is visible to the subscribing app is updated.
  class OrderCustomAttributeVisibleUpdatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::CustomAttributeEventData, optional: true, nullable: false

  end
end
