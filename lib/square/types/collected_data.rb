# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CollectedData < Internal::Types::Model
      field :input_text, -> { String }, optional: true, nullable: false
    end
  end
end
