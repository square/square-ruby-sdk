# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TeamMemberAssignedLocationsAssignmentType
      extend Square::Internal::Types::Enum

      ALL_CURRENT_AND_FUTURE_LOCATIONS = "ALL_CURRENT_AND_FUTURE_LOCATIONS"
      EXPLICIT_LOCATIONS = "EXPLICIT_LOCATIONS"
    end
  end
end
