# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module LoyaltyProgramAccrualRuleTaxMode
      extend Square::Internal::Types::Enum

      BEFORE_TAX = "BEFORE_TAX"
      AFTER_TAX = "AFTER_TAX"
    end
  end
end
