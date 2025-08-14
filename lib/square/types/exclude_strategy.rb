
module Square
  class ExcludeStrategy
    include Square::Internal::Types::Enum
    LEAST_EXPENSIVE = "LEAST_EXPENSIVE"
    MOST_EXPENSIVE = "MOST_EXPENSIVE"
  end
end
