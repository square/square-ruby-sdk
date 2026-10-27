# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module CubeType
      extend Square::Internal::Types::Enum

      CUBE = "cube"
      VIEW = "view"
    end
  end
end
