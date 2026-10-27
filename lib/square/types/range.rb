# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The range of a number value between the specified lower and upper bounds.
    class Range < Internal::Types::Model
      field :min, -> { String }, optional: true, nullable: true

      field :max, -> { String }, optional: true, nullable: true
    end
  end
end
