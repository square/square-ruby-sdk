# frozen_string_literal: true

module Square
  module Types
    module ExcludeStrategy
      extend Square::Internal::Types::Enum

      LEAST_EXPENSIVE = "LEAST_EXPENSIVE"
      MOST_EXPENSIVE = "MOST_EXPENSIVE"
      MOST_EXPENSIVE_LOWEST_VALUE = "MOST_EXPENSIVE_LOWEST_VALUE"
    end
  end
end
