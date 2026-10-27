# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module ScheduledShiftSortField
      extend Square::Internal::Types::Enum

      START_AT = "START_AT"
      END_AT = "END_AT"
      CREATED_AT = "CREATED_AT"
      UPDATED_AT = "UPDATED_AT"
    end
  end
end
