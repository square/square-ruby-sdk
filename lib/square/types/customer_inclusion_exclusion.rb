# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CustomerInclusionExclusion
      extend Square::Internal::Types::Enum

      INCLUDE = "INCLUDE"
      EXCLUDE = "EXCLUDE"
    end
  end
end
