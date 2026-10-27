# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module LoyaltyProgramStatus
      extend Square::Internal::Types::Enum

      INACTIVE = "INACTIVE"
      ACTIVE = "ACTIVE"
    end
  end
end
