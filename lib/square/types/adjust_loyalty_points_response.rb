# frozen_string_literal: true

module Square
  module Types
    # Represents an [AdjustLoyaltyPoints](api-endpoint:Loyalty-AdjustLoyaltyPoints) request.
    class AdjustLoyaltyPointsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :event, Square::Types::LoyaltyEvent, optional: true, nullable: false

    end
  end
end
