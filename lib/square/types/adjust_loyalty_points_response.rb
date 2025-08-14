# frozen_string_literal: true

module Square
    module Types
        # Represents an [AdjustLoyaltyPoints](api-endpoint:Loyalty-AdjustLoyaltyPoints) request.
        class AdjustLoyaltyPointsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :event, Square::LoyaltyEvent, optional: true, nullable: false
        end
    end
end
