# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when an [Order](entity:Order) is updated. This
    # event is triggered by the [UpdateOrder](api-endpoint:Orders-UpdateOrder)
    # endpoint call, Order Manager, or the Square Dashboard.
    class OrderUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::OrderUpdatedEventData }, optional: true, nullable: false
    end
  end
end
