# frozen_string_literal: true

module Square
  module Types
    # Filter criteria for searching transfer orders
    class TransferOrderFilter < Internal::Types::Model
      field :source_location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :destination_location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :statuses, lambda {
        Internal::Types::Array[Square::Types::TransferOrderStatus]
      }, optional: true, nullable: false
    end
  end
end
