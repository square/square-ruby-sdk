# frozen_string_literal: true

module Square
  module Types
    module JobAssignmentPayType
      extend Square::Internal::Types::Enum

      NONE = "NONE"
      HOURLY = "HOURLY"
      SALARY = "SALARY"
    end
  end
end
