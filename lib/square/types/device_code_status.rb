# frozen_string_literal: true

module Square
  module Types
    module DeviceCodeStatus
      extends Square::Internal::Types::Enum
      UNKNOWN = "UNKNOWN"
      UNPAIRED = "UNPAIRED"
      PAIRED = "PAIRED"
      EXPIRED = "EXPIRED"end
  end
end
