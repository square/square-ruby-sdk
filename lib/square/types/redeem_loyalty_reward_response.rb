# frozen_string_literal: true

module Square
    module Types
        # A response that includes the `LoyaltyEvent` published for redeeming the reward.
        class RedeemLoyaltyRewardResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :event, Square::LoyaltyEvent, optional: true, nullable: false
        end
    end
end
