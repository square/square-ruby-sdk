
module Square
  module Orders
    module Types
      class PayOrderRequest < Internal::Types::Model
        field :order_id, -> { String }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :order_version, -> { Integer }, optional: true, nullable: false
        field :payment_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      end
    end
  end
end
