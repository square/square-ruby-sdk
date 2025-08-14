# frozen_string_literal: true

module Square
    module Types
        # Provides information about a loyalty event. 
        # For more information, see [Search for Balance-Changing Loyalty Events](https://developer.squareup.com/docs/loyalty-api/loyalty-events).
        class LoyaltyEvent < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :type, Square::LoyaltyEventType, optional: false, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :accumulate_points, Square::LoyaltyEventAccumulatePoints, optional: true, nullable: false
            field :create_reward, Square::LoyaltyEventCreateReward, optional: true, nullable: false
            field :redeem_reward, Square::LoyaltyEventRedeemReward, optional: true, nullable: false
            field :delete_reward, Square::LoyaltyEventDeleteReward, optional: true, nullable: false
            field :adjust_points, Square::LoyaltyEventAdjustPoints, optional: true, nullable: false
            field :loyalty_account_id, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :source, Square::LoyaltyEventSource, optional: false, nullable: false
            field :expire_points, Square::LoyaltyEventExpirePoints, optional: true, nullable: false
            field :other_event, Square::LoyaltyEventOther, optional: true, nullable: false
            field :accumulate_promotion_points, Square::LoyaltyEventAccumulatePromotionPoints, optional: true, nullable: false
        end
    end
end
