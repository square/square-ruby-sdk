# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module VisibilityFilter
      extend Square::Internal::Types::Enum

      ALL = "ALL"
      READ = "READ"
      READ_WRITE = "READ_WRITE"
    end
  end
end
