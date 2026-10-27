# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module PayoutStatus
      extend Square::Internal::Types::Enum

      SENT = "SENT"
      FAILED = "FAILED"
      PAID = "PAID"
    end
  end
end
