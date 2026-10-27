# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module BusinessAppointmentSettingsBookingLocationType
      extend Square::Internal::Types::Enum

      BUSINESS_LOCATION = "BUSINESS_LOCATION"
      CUSTOMER_LOCATION = "CUSTOMER_LOCATION"
      PHONE = "PHONE"
    end
  end
end
