# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Filter criteria for searching transfer orders
    class TransferOrderFilter < Internal::Types::Model
      field :source_location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :destination_location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :statuses, -> { Internal::Types::Array[Square::Types::TransferOrderStatus] }, optional: true, nullable: true
    end
  end
end
