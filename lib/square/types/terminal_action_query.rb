# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TerminalActionQuery < Internal::Types::Model
      field :filter, -> { Square::Types::TerminalActionQueryFilter }, optional: true, nullable: false

      field :sort, -> { Square::Types::TerminalActionQuerySort }, optional: true, nullable: false
    end
  end
end
