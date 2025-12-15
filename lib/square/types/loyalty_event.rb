# frozen_string_literal: true

module Square
  module Types
    # Provides information about a loyalty event.
    # For more information, see [Search for Balance-Changing Loyalty
    # Events](https://developer.squareup.com/docs/loyalty-api/loyalty-events).
    class LoyaltyEvent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :type, -> { Square::Types::LoyaltyEventType }, optional: false, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :accumulate_points, -> { Square::Types::LoyaltyEventAccumulatePoints }, optional: true, nullable: false
      field :create_reward, -> { Square::Types::LoyaltyEventCreateReward }, optional: true, nullable: false
      field :redeem_reward, -> { Square::Types::LoyaltyEventRedeemReward }, optional: true, nullable: false
      field :delete_reward, -> { Square::Types::LoyaltyEventDeleteReward }, optional: true, nullable: false
      field :adjust_points, -> { Square::Types::LoyaltyEventAdjustPoints }, optional: true, nullable: false
      field :loyalty_account_id, -> { String }, optional: true, nullable: false
      field :location_id, -> { String }, optional: true, nullable: false
      field :source, -> { Square::Types::LoyaltyEventSource }, optional: false, nullable: false
      field :expire_points, -> { Square::Types::LoyaltyEventExpirePoints }, optional: true, nullable: false
      field :other_event, -> { Square::Types::LoyaltyEventOther }, optional: true, nullable: false
      field :accumulate_promotion_points, -> { Square::Types::LoyaltyEventAccumulatePromotionPoints }, optional: true, nullable: false
    end
  end
end
