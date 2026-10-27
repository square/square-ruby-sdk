# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class QueryFilter < Internal::Types::Model
      extend Square::Internal::Types::Union

      member -> { Square::Types::QueryFilterCondition }

      member -> { Square::Types::QueryFilterOr }

      member -> { Square::Types::QueryFilterAnd }
    end
  end
end
