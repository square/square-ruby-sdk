# frozen_string_literal: true

module Square
  module Types
    # The range of a number value between the specified lower and upper bounds.
    class Range < Internal::Types::Model
      field :min, -> { String }, optional: true, nullable: false
      field :max, -> { String }, optional: true, nullable: false

    end
  end
end
