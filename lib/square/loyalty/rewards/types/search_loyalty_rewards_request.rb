# frozen_string_literal: true

module Square
  module Loyalty
    module Rewards
      module Types
        class SearchLoyaltyRewardsRequest < Internal::Types::Model
          field :query, lambda {
            Square::Types::SearchLoyaltyRewardsRequestLoyaltyRewardQuery
          }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
