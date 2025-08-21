# frozen_string_literal: true

module Square
  module Types
    module EcomVisibility
      extend Square::Internal::Types::Enum

      UNINDEXED = "UNINDEXED"
      UNAVAILABLE = "UNAVAILABLE"
      HIDDEN = "HIDDEN"
      VISIBLE = "VISIBLE"end
  end
end
