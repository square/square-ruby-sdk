# frozen_string_literal: true

module Square
  module Orders
    module Types
      class GetOrdersRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
