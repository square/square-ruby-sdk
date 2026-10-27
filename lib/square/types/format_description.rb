# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Resolved format description with the predefined name and d3-format specifier
    class FormatDescription < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :specifier, -> { String }, optional: false, nullable: false

      field :currency, -> { String }, optional: true, nullable: false
    end
  end
end
