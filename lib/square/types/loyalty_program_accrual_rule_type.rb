# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module LoyaltyProgramAccrualRuleType
      extend Square::Internal::Types::Enum

      VISIT = "VISIT"
      SPEND = "SPEND"
      ITEM_VARIATION = "ITEM_VARIATION"
      CATEGORY = "CATEGORY"
    end
  end
end
