# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module ScheduledShiftFilterScheduledShiftStatus
      extend Square::Internal::Types::Enum

      DRAFT = "DRAFT"
      PUBLISHED = "PUBLISHED"
    end
  end
end
