# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module LoyaltyRewardStatus
      extend Square::Internal::Types::Enum

      ISSUED = "ISSUED"
      REDEEMED = "REDEEMED"
      DELETED = "DELETED"
    end
  end
end
