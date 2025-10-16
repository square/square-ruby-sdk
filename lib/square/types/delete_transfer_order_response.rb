# frozen_string_literal: true

module Square
  module Types
    # Response for deleting a transfer order
    class DeleteTransferOrderResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
