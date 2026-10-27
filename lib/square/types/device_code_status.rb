# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module DeviceCodeStatus
      extend Square::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      UNPAIRED = "UNPAIRED"
      PAIRED = "PAIRED"
      EXPIRED = "EXPIRED"
    end
  end
end
