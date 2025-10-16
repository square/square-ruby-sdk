# frozen_string_literal: true

module Square
  module TransferOrders
    module Types
      class CancelTransferOrderRequest < Internal::Types::Model
        field :transfer_order_id, -> { String }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :version, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
