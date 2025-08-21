# frozen_string_literal: true

module Square
  module Types
    # Represents a reward that can be applied to an order if the necessary
    # reward tier criteria are met. Rewards are created through the Loyalty API.
    class OrderReward < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :reward_tier_id, -> { String }, optional: false, nullable: false
    end
  end
end
