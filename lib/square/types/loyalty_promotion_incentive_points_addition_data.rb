# frozen_string_literal: true

module Square
  module Types
    # Represents the metadata for a `POINTS_ADDITION` type of [loyalty promotion
    # incentive](entity:LoyaltyPromotionIncentive).
    class LoyaltyPromotionIncentivePointsAdditionData < Internal::Types::Model
      field :points_addition, -> { Integer }, optional: false, nullable: false
    end
  end
end
