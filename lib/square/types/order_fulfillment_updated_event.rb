# frozen_string_literal: true

module Square
  module Types
    # Published when an [OrderFulfillment](entity:OrderFulfillment)
    # is created or updated. This event is triggered only by the
    # [UpdateOrder](api-endpoint:Orders-UpdateOrder) endpoint call.
    class OrderFulfillmentUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::OrderFulfillmentUpdatedEventData }, optional: true, nullable: false
    end
  end
end
