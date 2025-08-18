# frozen_string_literal: true

module Square
  module Types
    # Represents a contract to redeem loyalty points for a [reward tier](entity:LoyaltyProgramRewardTier) discount. Loyalty rewards can be in an ISSUED, REDEEMED, or DELETED state. 
    # For more information, see [Manage loyalty rewards](https://developer.squareup.com/docs/loyalty-api/loyalty-rewards).
    class LoyaltyReward < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :status, Square::Types::LoyaltyRewardStatus, optional: true, nullable: false
      field :loyalty_account_id, String, optional: false, nullable: false
      field :reward_tier_id, String, optional: false, nullable: false
      field :points, Integer, optional: true, nullable: false
      field :order_id, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :redeemed_at, String, optional: true, nullable: false

    end
  end
end
