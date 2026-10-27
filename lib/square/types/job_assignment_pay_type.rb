# frozen_string_literal: true

require_relative "../../square"

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
