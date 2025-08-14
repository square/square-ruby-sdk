# frozen_string_literal: true

module Square
    module Types
        # A response that includes the loyalty rewards satisfying the search criteria.
        class SearchLoyaltyRewardsResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :rewards, Internal::Types::Array[Square::LoyaltyReward], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
