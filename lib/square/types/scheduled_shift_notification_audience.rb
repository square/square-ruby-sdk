# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module ScheduledShiftNotificationAudience
      extend Square::Internal::Types::Enum

      ALL = "ALL"
      AFFECTED = "AFFECTED"
      NONE = "NONE"
    end
  end
end
