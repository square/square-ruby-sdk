# frozen_string_literal: true

module Square
  module Types
    # Format of measure or dimension - can be a simple string format, a link configuration, a custom time format, or a
    # custom numeric format
    class Format < Internal::Types::Model
      extend Square::Internal::Types::Union

      member -> { Square::Types::SimpleFormat }
      member -> { Square::Types::LinkFormat }
      member -> { Square::Types::CustomTimeFormat }
      member -> { Square::Types::CustomNumericFormat }
    end
  end
end
