# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module DeviceAttributesDeviceType
      extend Square::Internal::Types::Enum

      TERMINAL = "TERMINAL"
      HANDHELD = "HANDHELD"
    end
  end
end
