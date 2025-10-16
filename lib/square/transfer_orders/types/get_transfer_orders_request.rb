# frozen_string_literal: true

module Square
  module TransferOrders
    module Types
      class GetTransferOrdersRequest < Internal::Types::Model
        field :transfer_order_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
