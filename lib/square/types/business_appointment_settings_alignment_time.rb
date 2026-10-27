# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module BusinessAppointmentSettingsAlignmentTime
      extend Square::Internal::Types::Enum

      SERVICE_DURATION = "SERVICE_DURATION"
      QUARTER_HOURLY = "QUARTER_HOURLY"
      HALF_HOURLY = "HALF_HOURLY"
      HOURLY = "HOURLY"
    end
  end
end
