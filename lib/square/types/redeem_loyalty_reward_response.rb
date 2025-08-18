# frozen_string_literal: true

module Square
  module Types
    # A response that includes the `LoyaltyEvent` published for redeeming the reward.
    class RedeemLoyaltyRewardResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :event, -> { Square::Types::LoyaltyEvent }, optional: true, nullable: false

    end
  end
end
