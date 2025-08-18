# frozen_string_literal: true

module Square
  module Types
    module LoyaltyEventType
      extend Square::Internal::Types::Enum
      ACCUMULATE_POINTS = "ACCUMULATE_POINTS"
      CREATE_REWARD = "CREATE_REWARD"
      REDEEM_REWARD = "REDEEM_REWARD"
      DELETE_REWARD = "DELETE_REWARD"
      ADJUST_POINTS = "ADJUST_POINTS"
      EXPIRE_POINTS = "EXPIRE_POINTS"
      OTHER = "OTHER"
      ACCUMULATE_PROMOTION_POINTS = "ACCUMULATE_PROMOTION_POINTS"end
  end
end
