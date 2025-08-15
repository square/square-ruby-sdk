# frozen_string_literal: true

module Square
  # Published when a [gift card activity](entity:GiftCardActivity) is created.
  class GiftCardActivityCreatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::GiftCardActivityCreatedEventData, optional: true, nullable: false

  end
end
