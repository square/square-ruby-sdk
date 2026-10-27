# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CreateOrderRequest < Internal::Types::Model
      field :order, -> { Square::Types::Order }, optional: true, nullable: false

      field :idempotency_key, -> { String }, optional: true, nullable: false
    end
  end
end
