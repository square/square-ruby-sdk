# frozen_string_literal: true

module Square
  module Types
    # Response for starting a transfer order.
    class StartTransferOrderResponse < Internal::Types::Model
      field :transfer_order, -> { Square::Types::TransferOrder }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
