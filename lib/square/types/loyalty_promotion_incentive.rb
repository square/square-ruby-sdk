# frozen_string_literal: true

module Square
  module Types
    # Represents how points for a [loyalty promotion](entity:LoyaltyPromotion) are calculated,
    # either by multiplying the points earned from the base program or by adding a specified number
    # of points to the points earned from the base program.
    class LoyaltyPromotionIncentive < Internal::Types::Model
      field :type, -> { Square::Types::LoyaltyPromotionIncentiveType }, optional: false, nullable: false
      field :points_multiplier_data, -> { Square::Types::LoyaltyPromotionIncentivePointsMultiplierData }, optional: true, nullable: false
      field :points_addition_data, -> { Square::Types::LoyaltyPromotionIncentivePointsAdditionData }, optional: true, nullable: false

    end
  end
end
