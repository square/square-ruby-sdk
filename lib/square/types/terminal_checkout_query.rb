# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TerminalCheckoutQuery < Internal::Types::Model
      field :filter, -> { Square::Types::TerminalCheckoutQueryFilter }, optional: true, nullable: false

      field :sort, -> { Square::Types::TerminalCheckoutQuerySort }, optional: true, nullable: false
    end
  end
end
