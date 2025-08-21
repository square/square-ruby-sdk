# frozen_string_literal: true

module Square
  module Orders
    module Types
      class CloneOrderRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false
        field :version, -> { Integer }, optional: true, nullable: false
        field :idempotency_key, -> { String }, optional: true, nullable: false
      end
    end
  end
end
