# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module ChangeTiming
      extend Square::Internal::Types::Enum

      IMMEDIATE = "IMMEDIATE"
      END_OF_BILLING_CYCLE = "END_OF_BILLING_CYCLE"
    end
  end
end
