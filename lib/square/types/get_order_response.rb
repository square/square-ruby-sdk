# frozen_string_literal: true

module Square
    module Types
        class GetOrderResponse < Square::Internal::Types::Model
            field :order, Square::Order, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
