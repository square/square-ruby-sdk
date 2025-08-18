# frozen_string_literal: true

module Square
  module Types
    module DeviceStatusCategory
      extend Square::Internal::Types::Enum
      AVAILABLE = "AVAILABLE"
      NEEDS_ATTENTION = "NEEDS_ATTENTION"
      OFFLINE = "OFFLINE"end
  end
end
