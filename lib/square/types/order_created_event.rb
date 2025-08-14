# frozen_string_literal: true

module Square
    module Types
        # Published when an [Order](entity:Order) is created. This event is
        # triggered only by the [CreateOrder](api-endpoint:Orders-CreateOrder) endpoint call.
        # 
        # Creating an order in the Point of Sale app will **not** publish this event.
        class OrderCreatedEvent < Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::OrderCreatedEventData, optional: true, nullable: false
        end
    end
end
