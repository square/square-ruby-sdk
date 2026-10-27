# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module BusinessBookingProfileCustomerTimezoneChoice
      extend Square::Internal::Types::Enum

      BUSINESS_LOCATION_TIMEZONE = "BUSINESS_LOCATION_TIMEZONE"
      CUSTOMER_CHOICE = "CUSTOMER_CHOICE"
    end
  end
end
