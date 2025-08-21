# frozen_string_literal: true

module Square
  module Loyalty
    module Rewards
      module Types
        class RedeemLoyaltyRewardRequest < Internal::Types::Model
          field :reward_id, -> { String }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :location_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
