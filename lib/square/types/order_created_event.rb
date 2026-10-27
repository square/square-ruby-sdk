# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when an [Order](entity:Order) is created. This event is
    # triggered only by the [CreateOrder](api-endpoint:Orders-CreateOrder) endpoint call.
    #
    # Creating an order in the Point of Sale app will **not** publish this event.
    class OrderCreatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::OrderCreatedEventData }, optional: true, nullable: false
    end
  end
end
