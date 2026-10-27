# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TimecardWorkdayMatcher
      extend Square::Internal::Types::Enum

      START_AT = "START_AT"
      END_AT = "END_AT"
      INTERSECTION = "INTERSECTION"
    end
  end
end
