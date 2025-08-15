# frozen_string_literal: true

module Square
  # Specific details for curbside pickup.
  class FulfillmentPickupDetailsCurbsidePickupDetails < Internal::Types::Model
    field :curbside_details, String, optional: true, nullable: false
    field :buyer_arrived_at, String, optional: true, nullable: false

  end
end
