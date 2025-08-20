# frozen_string_literal: true

module Square
  module Orders
    module Types
      class UpdateOrderRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false
        field :order, -> { Square::Types::Order }, optional: true, nullable: false
        field :fields_to_clear, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :idempotency_key, -> { String }, optional: true, nullable: false
      end
    end
  end
end
