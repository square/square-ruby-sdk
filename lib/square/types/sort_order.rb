# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module SortOrder
      extend Square::Internal::Types::Enum

      DESC = "DESC"
      ASC = "ASC"
    end
  end
end
