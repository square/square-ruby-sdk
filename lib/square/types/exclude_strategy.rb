# frozen_string_literal: true

module Square
  module Types
    module ExcludeStrategy
      extends Square::Internal::Types::Enum
      LEAST_EXPENSIVE = "LEAST_EXPENSIVE"
      MOST_EXPENSIVE = "MOST_EXPENSIVE"end
  end
end
