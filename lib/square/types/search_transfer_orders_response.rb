# frozen_string_literal: true

module Square
  module Types
    # Response for searching transfer orders
    class SearchTransferOrdersResponse < Internal::Types::Model
      field :transfer_orders, lambda {
        Internal::Types::Array[Square::Types::TransferOrder]
      }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
