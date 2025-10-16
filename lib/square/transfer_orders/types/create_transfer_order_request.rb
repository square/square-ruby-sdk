# frozen_string_literal: true

module Square
  module TransferOrders
    module Types
      class CreateTransferOrderRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :transfer_order, -> { Square::Types::CreateTransferOrderData }, optional: false, nullable: false
      end
    end
  end
end
