# frozen_string_literal: true

module Square
  # A response that includes the `LoyaltyEvent` published for redeeming the reward.
  class RedeemLoyaltyRewardResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :event, Square::LoyaltyEvent, optional: true, nullable: false

  end
end
