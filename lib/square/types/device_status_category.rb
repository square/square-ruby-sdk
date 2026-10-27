# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module DeviceStatusCategory
      extend Square::Internal::Types::Enum

      AVAILABLE = "AVAILABLE"
      NEEDS_ATTENTION = "NEEDS_ATTENTION"
      OFFLINE = "OFFLINE"
    end
  end
end
