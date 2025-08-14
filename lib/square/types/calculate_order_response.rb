# frozen_string_literal: true

module Square
    module Types
        class CalculateOrderResponse < Internal::Types::Model
            field :order, Square::Order, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
