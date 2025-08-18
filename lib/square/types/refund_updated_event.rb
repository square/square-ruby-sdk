# frozen_string_literal: true

module Square
  module Types
    # Published when a [Refund](entity:PaymentRefund) is updated.
    # Typically the `refund.status` changes when a refund is completed.
    class RefundUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::RefundUpdatedEventData }, optional: true, nullable: false

    end
  end
end
