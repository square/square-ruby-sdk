# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CashDrawerShiftState
      extend Square::Internal::Types::Enum

      OPEN = "OPEN"
      ENDED = "ENDED"
      CLOSED = "CLOSED"
    end
  end
end
