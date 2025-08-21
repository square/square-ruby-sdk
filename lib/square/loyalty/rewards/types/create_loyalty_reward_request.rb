# frozen_string_literal: true

module Square
  module Loyalty
    module Rewards
      module Types
        class CreateLoyaltyRewardRequest < Internal::Types::Model
          field :reward, -> { Square::Types::LoyaltyReward }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
