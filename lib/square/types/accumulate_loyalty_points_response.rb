# frozen_string_literal: true

module Square
  # Represents an [AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints) response.
  class AccumulateLoyaltyPointsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :event, Square::LoyaltyEvent, optional: true, nullable: false
    field :events, Internal::Types::Array[Square::LoyaltyEvent], optional: true, nullable: false

  end
end
