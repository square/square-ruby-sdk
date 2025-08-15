# frozen_string_literal: true

module Square
  # A response that includes the loyalty reward.
  class GetLoyaltyRewardResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :reward, Square::LoyaltyReward, optional: true, nullable: false

  end
end
