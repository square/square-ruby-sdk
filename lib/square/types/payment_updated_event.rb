# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a [Payment](entity:Payment) is updated.
    # Typically the `payment.status`, or `card_details.status` fields are updated
    # as a payment is canceled, authorized, or completed.
    class PaymentUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::PaymentUpdatedEventData }, optional: true, nullable: false
    end
  end
end
