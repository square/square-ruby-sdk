# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Specifies a decimal number range.
    class FloatNumberRange < Internal::Types::Model
      field :start_at, -> { String }, optional: true, nullable: true

      field :end_at, -> { String }, optional: true, nullable: true
    end
  end
end
