
module Square
  module Orders
    module Types
      class CalculateOrderRequest < Internal::Types::Model
        field :order, Square::Types::Order, optional: false, nullable: false
        field :proposed_rewards, Internal::Types::Array[Square::Types::OrderReward], optional: true, nullable: false

      end
    end
  end
end
