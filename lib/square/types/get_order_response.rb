# frozen_string_literal: true

module Square
  module Types
    class GetOrderResponse < Internal::Types::Model
      field :order, -> { Square::Types::Order }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
