# frozen_string_literal: true

module Square
  # Published when a [Payment](entity:Payment) is updated.
  # Typically the `payment.status`, or `card_details.status` fields are updated
  # as a payment is canceled, authorized, or completed.
  class PaymentUpdatedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::PaymentUpdatedEventData, optional: true, nullable: false

  end
end
