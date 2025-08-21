# frozen_string_literal: true

module Square
  module Types
    # Represents the metadata for a `POINTS_MULTIPLIER` type of [loyalty promotion incentive](entity:LoyaltyPromotionIncentive).
    class LoyaltyPromotionIncentivePointsMultiplierData < Internal::Types::Model
      field :points_multiplier, -> { Integer }, optional: true, nullable: false
      field :multiplier, -> { String }, optional: true, nullable: false
    end
  end
end
