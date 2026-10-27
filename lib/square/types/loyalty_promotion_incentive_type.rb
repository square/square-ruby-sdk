# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module LoyaltyPromotionIncentiveType
      extend Square::Internal::Types::Enum

      POINTS_MULTIPLIER = "POINTS_MULTIPLIER"
      POINTS_ADDITION = "POINTS_ADDITION"
    end
  end
end
