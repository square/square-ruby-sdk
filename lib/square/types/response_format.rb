# frozen_string_literal: true

module Square
  module Types
    module ResponseFormat
      extend Square::Internal::Types::Enum

      DEFAULT = "default"
      COMPACT = "compact"
      COLUMNAR = "columnar"
    end
  end
end
