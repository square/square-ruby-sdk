# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module EcomVisibility
      extend Square::Internal::Types::Enum

      UNINDEXED = "UNINDEXED"
      UNAVAILABLE = "UNAVAILABLE"
      HIDDEN = "HIDDEN"
      VISIBLE = "VISIBLE"
    end
  end
end
