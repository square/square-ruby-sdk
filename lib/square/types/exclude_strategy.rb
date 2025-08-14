
module Square
  class ExcludeStrategy
    includes Square::Internal::Types::Enum
    LEAST_EXPENSIVE = "LEAST_EXPENSIVE"
    MOST_EXPENSIVE = "MOST_EXPENSIVE"
  end
end
