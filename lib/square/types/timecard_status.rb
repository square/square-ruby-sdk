# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TimecardStatus
      extend Square::Internal::Types::Enum

      OPEN = "OPEN"
      CLOSED = "CLOSED"
    end
  end
end
