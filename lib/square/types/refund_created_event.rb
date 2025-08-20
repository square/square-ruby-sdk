# frozen_string_literal: true

module Square
  module Types
    # Published when a [Refund](entity:PaymentRefund) is created.
    class RefundCreatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::RefundCreatedEventData }, optional: true, nullable: false
    end
  end
end
