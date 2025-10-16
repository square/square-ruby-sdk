# frozen_string_literal: true

module Square
  module Types
    # Query parameters for searching transfer orders
    class TransferOrderQuery < Internal::Types::Model
      field :filter, -> { Square::Types::TransferOrderFilter }, optional: true, nullable: false
      field :sort, -> { Square::Types::TransferOrderSort }, optional: true, nullable: false
    end
  end
end
