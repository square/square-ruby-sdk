# frozen_string_literal: true

module Square
  module Types
    module DeviceComponentDetailsExternalPower
      extend Square::Internal::Types::Enum

      AVAILABLE_CHARGING = "AVAILABLE_CHARGING"
      AVAILABLE_NOT_IN_USE = "AVAILABLE_NOT_IN_USE"
      UNAVAILABLE = "UNAVAILABLE"
      AVAILABLE_INSUFFICIENT = "AVAILABLE_INSUFFICIENT"
    end
  end
end
