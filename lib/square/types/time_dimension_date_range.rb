# frozen_string_literal: true

module Square
  module Types
    class TimeDimensionDateRange < Internal::Types::Model
      extend Square::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[String] }
      member -> { Internal::Types::Hash[String, Object] }
    end
  end
end
