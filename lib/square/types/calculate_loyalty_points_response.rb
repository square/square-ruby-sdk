# frozen_string_literal: true

module Square
  module Types
    # Represents a [CalculateLoyaltyPoints](api-endpoint:Loyalty-CalculateLoyaltyPoints) response.
    class CalculateLoyaltyPointsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :points, Integer, optional: true, nullable: false
      field :promotion_points, Integer, optional: true, nullable: false

    end
  end
end
