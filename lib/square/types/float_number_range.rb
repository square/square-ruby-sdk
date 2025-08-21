# frozen_string_literal: true

module Square
  module Types
    # Specifies a decimal number range.
    class FloatNumberRange < Internal::Types::Model
      field :start_at, -> { String }, optional: true, nullable: false
      field :end_at, -> { String }, optional: true, nullable: false
    end
  end
end
