# frozen_string_literal: true

module Square
  module Types
    # Response for canceling a transfer order
    class CancelTransferOrderResponse < Internal::Types::Model
      field :transfer_order, -> { Square::Types::TransferOrder }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
