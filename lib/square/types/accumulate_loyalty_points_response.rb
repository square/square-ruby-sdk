# frozen_string_literal: true

module Square
    module Types
        # Represents an [AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints) response.
        class AccumulateLoyaltyPointsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :event, Square::LoyaltyEvent, optional: true, nullable: false
            field :events, Square::Internal::Types::Array[Square::LoyaltyEvent], optional: true, nullable: false
        end
    end
end
