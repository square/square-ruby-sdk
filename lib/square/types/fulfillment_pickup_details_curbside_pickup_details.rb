# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Specific details for curbside pickup.
    class FulfillmentPickupDetailsCurbsidePickupDetails < Internal::Types::Model
      field :curbside_details, -> { String }, optional: true, nullable: true

      field :buyer_arrived_at, -> { String }, optional: true, nullable: true
    end
  end
end
