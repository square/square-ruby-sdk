# frozen_string_literal: true

module Square
  module Types
    module PayoutType
      extend Square::Internal::Types::Enum

      BATCH = "BATCH"
      SIMPLE = "SIMPLE"
    end
  end
end
