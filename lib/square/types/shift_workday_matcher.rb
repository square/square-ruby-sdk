# frozen_string_literal: true

module Square
  module Types
    module ShiftWorkdayMatcher
      extend Square::Internal::Types::Enum

      START_AT = "START_AT"
      END_AT = "END_AT"
      INTERSECTION = "INTERSECTION"
    end
  end
end
