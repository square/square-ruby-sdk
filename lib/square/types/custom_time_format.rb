# frozen_string_literal: true

module Square
  module Types
    # Custom time format for time dimensions
    class CustomTimeFormat < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
