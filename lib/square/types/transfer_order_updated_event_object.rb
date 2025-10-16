# frozen_string_literal: true

module Square
  module Types
    class TransferOrderUpdatedEventObject < Internal::Types::Model
      field :transfer_order, -> { Square::Types::TransferOrder }, optional: true, nullable: false
    end
  end
end
