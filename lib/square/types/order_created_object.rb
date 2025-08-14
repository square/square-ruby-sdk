# frozen_string_literal: true

module Square
    module Types
        class OrderCreatedObject < Square::Internal::Types::Model
            field :order_created, Square::OrderCreated, optional: true, nullable: false
        end
    end
end
